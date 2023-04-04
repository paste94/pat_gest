import 'package:flutter/material.dart';

Future<dynamic> showErrorAlert(BuildContext context, String text) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: Text(text),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              )
            ],
          ));
}
