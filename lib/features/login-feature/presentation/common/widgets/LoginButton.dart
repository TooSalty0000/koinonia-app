import 'package:flutter/material.dart';

class LoginPageButton extends StatelessWidget {
  final String buttonText;
  final Function()? onButtonPressed;
  const LoginPageButton({
    super.key,
    required this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: SizedBox(
        width: 312,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            onButtonPressed!();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Color(0xFF6F4E37)), // The brown color for the button
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                side: BorderSide(color: Color(0xFF6F4E37)), // The border color
              ),
            ),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                vertical: 10)), // Vertical padding, adjust to your preference
          ),
          child: Text(buttonText, // The text on the button
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Color(0xFFFFFFFF), fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }
}
