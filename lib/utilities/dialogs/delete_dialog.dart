import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/utilities/dialogs/generic_dialog.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<bool> showDeleteDialog<T>({
  required BuildContext context,
}) async {
  return showGenericDialog<bool>(
    context: context,
    title: 'Delete',
    content: 'Are you sure do you want delete this note?',
    optionsBuilder: () => {
      'Delete': true,
      'Cancel': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
