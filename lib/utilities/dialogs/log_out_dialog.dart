import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/generated/l10n.dart';
import 'package:notes/utilities/dialogs/generic_dialog.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<bool> showLogOutDialog<T>({
  required BuildContext context,
  required String title,
}) async {
  return showGenericDialog<bool>(
    context: context,
    title: S.of(context).logout_button,
    content: S.of(context).logout_dialog_prompt,
    optionsBuilder: () => {
      S.of(context).cancel: true,
      S.of(context).logout_button: true,
    },
  ).then(
    (value) => value ?? false,
  );
}
