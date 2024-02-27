import 'package:flutter/material.dart';
import 'package:koinonia/features/biblereading-feature/presentation/widgets/ConfirmationButton.dart';
import 'package:koinonia/features/biblereading-feature/presentation/widgets/ReadingContent.dart';
import 'package:koinonia/features/biblereading-feature/presentation/widgets/TriangleButton.dart';

class BibleReadingPage extends StatelessWidget {
  const BibleReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TriangleDecoration(isLeftAligned: true),
                  SizedBox(
                      width: 20), // Spacing between the triangle and the text
                  MainColumnContent(),
                  SizedBox(
                      width: 20), // Spacing between the text and the triangle
                  TriangleDecoration(isLeftAligned: false),
                ],
              ),
              SizedBox(height: 20), // Spacing between sections
              ReadingContent(),
              SizedBox(height: 20), // Spacing before the question
              SizedBox(height: 10), // Spacing before the confirmation button
              ConfirmationButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class MainColumnContent extends StatelessWidget {
  const MainColumnContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '1일',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 41.89,
            fontFamily: 'Tenada',
            fontWeight: FontWeight.w800,
          ),
        ), // Spacing between the text widgets
        Text(
          '창 1-3',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.89,
            fontFamily: 'Tenada',
            fontWeight: FontWeight.w800,
          ),
        ), // Spacing between the text widgets
        Text(
          '성서 유니온 1년통독',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Tenada',
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
