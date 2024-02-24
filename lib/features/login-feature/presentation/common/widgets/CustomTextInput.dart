import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller; // Use TextEditingController

  const CustomTextInput({
    super.key,
    required this.hintText,
    this.isPassword = false, // Default isPassword to false
    required this.controller, // Make controller a required parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: SizedBox(
        width: 312,
        height: 56,
        child: TextField(
          controller: controller, // Assign the passed controller here
          obscureText: isPassword, // Use the isPassword parameter here
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFF9C6954), width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFFEDE2DE), width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            fillColor: const Color.fromARGB(0, 255, 255, 255),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          ),
          cursorColor: const Color(0xFF000000),
        ),
      ),
    );
  }
}
