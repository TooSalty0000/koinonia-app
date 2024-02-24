// ignore_for_file: file_names

import 'package:flutter/material.dart';
// Ensure this import is correctly pointing to your RegisterPage location

class CreateAccountPrompt extends StatelessWidget {
  const CreateAccountPrompt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            '계정이 없으신가요?',
            style: TextStyle(
              color: Colors.black, // Color of the text
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/register');
            },
            child: const Text(
              '회원가입',
              style: TextStyle(
                color: Colors.black, // Color of the text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
