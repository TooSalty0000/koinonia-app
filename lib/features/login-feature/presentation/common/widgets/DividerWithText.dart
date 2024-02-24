import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      child: Row(
        children: <Widget>[
          const Expanded(child: Divider(thickness: 1, color: Colors.black)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(text, style: const TextStyle(color: Colors.black)),
          ),
          const Expanded(child: Divider(thickness: 1, color: Colors.black)),
        ],
      ),
    );
  }
}
