import 'package:flutter/material.dart';

class SocialSignInButtons extends StatelessWidget {
  final Function onGoogleSignIn;
  final Function onAppleSignIn;
  final Function onKakaoTalkSignIn;

  const SocialSignInButtons({
    super.key,
    required this.onGoogleSignIn,
    required this.onAppleSignIn,
    required this.onKakaoTalkSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SignInButton(
          icon: Icons.apple,
          backgroundColor: Colors.white,
          iconColor: Colors.black,
          onPressed: onAppleSignIn,
        ),
        SignInButton(
          icon: Icons.g_translate,
          backgroundColor: Colors.black,
          iconColor: Colors.white,
          onPressed: onGoogleSignIn,
        ),
        SignInButton(
          icon: Icons.chat,
          backgroundColor: Colors.yellow,
          iconColor: Colors.black,
          onPressed: onKakaoTalkSignIn,
        ),
      ],
    );
  }
}

class SignInButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Function onPressed;

  const SignInButton({
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          onPrimary: iconColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => onPressed(),
        child: Icon(icon, size: 24),
      ),
    );
  }
}
