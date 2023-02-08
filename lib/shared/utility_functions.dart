import 'package:flutter/material.dart';

Future<void> showUnsavedDataWarningDialog(
    BuildContext context, VoidCallback onPressed) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Unsaved Data!'),
          content: const SingleChildScrollView(
            child: Text(
                'Are you sure you want to go back? Any unsaved data will be lost.'),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const CircleBorder())),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const CircleBorder())),
              onPressed: () {
                Navigator.of(context).pop();
                onPressed();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      });
}
