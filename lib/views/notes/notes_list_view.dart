import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/services/crud/notes_services.dart';

typedef DeleteNoteCallback = void Function(DatabaseNote note);

class NotesListView extends StatelessWidget {
  final List<DatabaseNote> notes;

  final DeleteNoteCallback deleteNoteCallback;

  const NotesListView(
      {Key? key,
        required this.notes,
        required this.deleteNoteCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return ListTile(
          title: Text(
            note.text,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () {
              final shouldDelete = await showDeleteDialog(context);

              if(shouldDelete){
                deleteNoteCallback(note);
              }

            },
            icon: const Icon(Icons.delete),
          ),

        );
      },

    );
  }
}
