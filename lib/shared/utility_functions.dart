import 'package:flutter/material.dart';
import 'package:recipe_app/shared/constants.dart';

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
                  overlayColor: MaterialStateProperty.all<Color>(colorBrown),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const CircleBorder())),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(colorBrown),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const CircleBorder())),
              onPressed: () {
                Navigator.of(context).pop();
                onPressed();
              },
              child: const Text('Yes', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      });
}
