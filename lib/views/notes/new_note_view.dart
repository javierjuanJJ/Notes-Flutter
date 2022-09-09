import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/services/auth/auth_service.dart';
import 'package:notes/services/crud/notes_services.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({Key? key}) : super(key: key);

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {

  DatabaseNote? _note;
  late final NotesService _notesService;
  late final TextEditingController _textController;

  Future<DatabaseNote> createNewNote() async {
    final existingNote = _note;
    if(existingNote != null) {
      return existingNote;
    }
    final currentUser = AuthService.firebase().currentUser!;
    final currentEmail = currentUser.email!;
    final owner = await _notesService.getUser(email: currentEmail);
    return await _notesService.createNote(owner: owner);
  }

  void _deleteNoteIfTextIsEmpty() async {
    final existingNote = _note;

    if (_textController.text.isEmpty && existingNote != null){
        _notesService.deleteNote(id: existingNote.id);
    }
  }

  void _saveNoteIfTextIsEmpty() async {
    final existingNote = _note;

    if (existingNote != null && _textController.text.isNotEmpty){
      _notesService.updateNote(note: existingNote, text: _textController.text);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Note'),),
      body: const Text(''),
    );
  }
}
