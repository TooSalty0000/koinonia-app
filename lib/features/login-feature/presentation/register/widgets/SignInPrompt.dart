import 'package:flutter/material.dart';

class SignInPrompt extends StatelessWidget {
  const SignInPrompt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('계정이 이미 있으신가요? ', style: TextStyle(color: Colors.black)),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('로그인', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
