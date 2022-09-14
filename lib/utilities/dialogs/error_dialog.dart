import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/generated/l10n.dart';
import 'package:notes/utilities/dialogs/generic_dialog.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<void> showErrorDialog<T>({
  required BuildContext context,
  required String title,
}) async {
  return showGenericDialog<bool>(
    context: context,
    title: S.of(context).generic_error_prompt,
    content: title,
    optionsBuilder: () => {S.of(context).ok: null},
  ).then(
    (value) => value ?? false,
  );
}
