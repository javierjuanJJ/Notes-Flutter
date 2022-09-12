import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/services/crud/notes_services.dart';
import 'package:notes/utilities/dialogs/delete_dialog.dart';

typedef NoteCallback = void Function(DatabaseNote note);
typedef onTap = void Function(DatabaseNote note);

class NotesListView extends StatelessWidget {
  final List<DatabaseNote> notes;

  final NoteCallback deleteNoteCallback;
  final onTap OnTap;

  const NotesListView(
      {Key? key,
      required this.notes,
      required this.deleteNoteCallback,
      required this.OnTap})
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
            onPressed: () async {
              final shouldDelete =
                  await showDeleteDialog(context: context, title: '');

              if (shouldDelete) {
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
