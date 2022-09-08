
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showLoginError(BuildContext context, String text) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Error dialog'),
        content: Text(text),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'))
        ],
      );
    },
  );
}
