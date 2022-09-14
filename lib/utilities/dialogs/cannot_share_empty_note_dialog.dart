import 'package:flutter/material.dart';
import 'package:notes/generated/l10n.dart';
import 'package:notes/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: S.of(context).sharing,
    content: S.of(context).cannot_share_empty_note_prompt,
    optionsBuilder: () => {
      S.of(context).ok: null,
    },
  );
}
