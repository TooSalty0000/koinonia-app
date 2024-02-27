import 'package:flutter/material.dart';

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      height: 55,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFF3F3B3A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.20),
          ),
        ),
        onPressed: () {
          // Add your onPressed functionality here
          print('Button Pressed');
        },
        child: const Text(
          '완료',
          style: TextStyle(
            color: Colors.white, // Assuming you want white text
            fontSize: 25.9, // Adjust the font size as needed
          ),
        ),
      ),
    );
  }
}
