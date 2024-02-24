import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 393,
      height: 312,
      child: Stack(
        children: [
          const Positioned(
            left: 7,
            top: 124,
            child: SizedBox(
              width: 309,
              child: Text(
                'Koinonia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFEDE2DE),
                  fontSize: 67.77,
                  fontFamily: 'Tenada',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 135,
            top: 195,
            child: Container(
              width: 258,
              height: 16,
              decoration: BoxDecoration(color: Color(0xFFE8DAD5)),
            ),
          ),
          Positioned(
            left: 186,
            top: 225,
            child: Container(
              width: 207,
              height: 16,
              decoration: const BoxDecoration(color: Color(0xFFEDE2DE)),
            ),
          ),
        ],
      ),
    );
  }
}
