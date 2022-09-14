import 'package:flutter/material.dart';
import 'package:notes/generated/l10n.dart';
import 'package:notes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: S.of(context).password_reset,
    content: S.of(context).password_reset_dialog_prompt,
    optionsBuilder: () => {
      S.of(context).ok: null,
    },
  );
}
