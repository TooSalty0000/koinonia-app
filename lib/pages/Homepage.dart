import 'package:flutter/material.dart';

import '../widgets/quickactions.dart';
import '../widgets/groupchatList.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          QuickAccess(),
          Text(
            "Group Chats",
            style: TextStyle(
              fontSize: 39.3,
              fontWeight: FontWeight.w100,
            ),
            textAlign: TextAlign.start,
          ),
          GroupChatList()
        ],
      ),
    );
  }
}
