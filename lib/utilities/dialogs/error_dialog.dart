import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/utilities/dialogs/generic_dialog.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<void> showErrorDialog<T>({
  required BuildContext context,
  required String title,
}) async {
  return showGenericDialog<bool>(
    context: context,
    title: 'An erroc ocurred',
    content: title,
    optionsBuilder: () => {'OK': null},
  ).then(
    (value) => value ?? false,
  );
}
