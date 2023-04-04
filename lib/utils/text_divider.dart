import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;
  const TextDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(right: 20.0), child: const Divider()),
      ),
      Text(
        text,
        style: const TextStyle(color: Color.fromARGB(255, 200, 199, 199)),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 20.0), child: const Divider()),
      ),
    ]);
  }
}
