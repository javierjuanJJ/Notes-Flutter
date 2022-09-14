import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/generated/l10n.dart';
import 'package:notes/utilities/dialogs/generic_dialog.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<bool> showDeleteDialog<T>({
  required BuildContext context,
}) async {
  return showGenericDialog<bool>(
    context: context,
    title: S.of(context).delete,
    content: S.of(context).delete_note_prompt,
    optionsBuilder: () => {
      S.of(context).cancel: true,
      S.of(context).yes: true,
    },
  ).then(
    (value) => value ?? false,
  );
}
