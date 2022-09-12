import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/services/auth/auth_service.dart';
import 'package:notes/services/crud/notes_services.dart';
import 'package:notes/utilities/generics/get_arguments.dart';

class CreateUpdateNoteView extends StatefulWidget {
  const CreateUpdateNoteView({Key? key}) : super(key: key);

  @override
  State<CreateUpdateNoteView> createState() => _CreateUpdateNoteViewState();
}

class _CreateUpdateNoteViewState extends State<CreateUpdateNoteView> {
  DatabaseNote? _note;
  late final NotesService _notesService;
  late final TextEditingController _textController;

  Future<DatabaseNote?> _createOrGetExistingNote() async {
    final widgetNote = context.getArgument<DatabaseNote>();

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
    final currentEmail = currentUser.email!;
    final owner = await _notesService.getUser(email: currentEmail);
    final newNote = await _notesService.createNote(owner: owner);
    _note = newNote;
    return _note;
  }

  void _deleteNoteIfTextIsEmpty() async {
    final existingNote = _note;

    if (_textController.text.isEmpty && existingNote != null) {
      _notesService.deleteNote(id: existingNote.id);
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

    if (existingNote != null && _textController.text.isNotEmpty) {
      _notesService.updateNote(note: existingNote, text: _textController.text);
    }
  }

  void _testControllerListener() async {
    final note = _note;
    final text = _textController.text;

    if (note != null) {
      _notesService.updateNote(note: note, text: text);
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
    _notesService = NotesService();
    _textController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
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
