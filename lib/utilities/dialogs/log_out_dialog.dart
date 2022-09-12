import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/utilities/dialogs/generic_dialog.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<bool> showLogOutDialog<T>({
  required BuildContext context,
  required String title,
}) async {
  return showGenericDialog<bool>(
    context: context,
    title: 'Log Out',
    content: 'Are you sure do you want log out?',
    optionsBuilder: () => {
      'Log out': true,
      'Cancel': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
