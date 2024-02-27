import 'package:flutter/material.dart';

class TriangleDecoration extends StatelessWidget {
  final bool isLeftAligned;

  const TriangleDecoration({Key? key, this.isLeftAligned = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: isLeftAligned ? -1.57 : 1.57,
      child: Container(
        width: 60,
        height: 60,
        decoration: const ShapeDecoration(
          color: Color(0xFF9C6954),
          shape: StarBorder.polygon(sides: 3),
        ),
        child: Transform.rotate(
          angle:
              -1.57, // Re-rotate the content of the container to align text or icons if needed
          child: Align(
            alignment: Alignment.bottomRight,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: 0.5,
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
