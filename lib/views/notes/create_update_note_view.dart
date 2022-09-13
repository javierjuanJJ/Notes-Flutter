import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/extensions/generics/get_arguments.dart';
import 'package:notes/services/auth/auth_service.dart';
import 'package:notes/services/cloud/cloud_note.dart';
import 'package:notes/services/cloud/firebase_cloud_storage.dart';
import 'package:notes/utilities/dialogs/cannot_share_empty_note_dialog.dart';
import 'package:share_plus/share_plus.dart';

class CreateUpdateNoteView extends StatefulWidget {
  const CreateUpdateNoteView({Key? key}) : super(key: key);

  @override
  State<CreateUpdateNoteView> createState() => _CreateUpdateNoteViewState();
}

class _CreateUpdateNoteViewState extends State<CreateUpdateNoteView> {
  CloudNote? _note;
  late final FirebaseCloudStorage _notesService;
  late final TextEditingController _textController;

  Future<CloudNote> _createOrGetExistingNote() async {
    final widgetNote = context.getArgument<CloudNote>();

    if (widgetNote != null) {
      _note = widgetNote;
      _textController.text = widgetNote.text;
      return widgetNote;
    }

    final existingNote = _note;
    if (existingNote != null) {
      return existingNote;
    }
    final currentUser = AuthService.firebase().currentUser!;
    final userId = currentUser.id;
    final newNote = await _notesService.createNewNote(ownerUserId: userId);
    _note = newNote;
    return newNote;
  }

  void _deleteNoteIfTextIsEmpty() async {
    final existingNote = _note;

    if (_textController.text.isEmpty && existingNote != null) {
      _notesService.deleteNote(documentId: existingNote.documentId);
    }
  }

  void _setupTextControllerListener() async {
    _textController.removeListener(() {
      _testControllerListener();
    });
    _textController.addListener(() {
      _testControllerListener();
    });
  }

  void _saveNoteIfTextIsEmpty() async {
    final existingNote = _note;
    final text = _textController.text;
    if (existingNote != null && text.isNotEmpty) {
      await _notesService.updateNote(
        documentId: existingNote.documentId,
        text: text,
      );
    }
  }

  void _testControllerListener() async {
    final note = _note;
    final text = _textController.text;

    if (note != null) {
      final text = _textController.text;
      await _notesService.updateNote(
        documentId: note.documentId,
        text: text,
      );
    }
  }

  @override
  void dispose() {
    _deleteNoteIfTextIsEmpty();
    _saveNoteIfTextIsEmpty();
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _notesService = FirebaseCloudStorage();
    _textController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              final text = _textController.text;
              if (text == null || text.isEmpty) {
                await showCannotShareEmptyNoteDialog(context);
              } else {
                Share.share(text);
              }
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _createOrGetExistingNote(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              _setupTextControllerListener();
              return TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: 'Start typing your note... '),
              );

            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
