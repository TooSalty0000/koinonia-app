import 'dart:async';

import 'package:flutter/material.dart';

class GroupChatList extends StatelessWidget {
  const GroupChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return GroupChat(groupName: "Group Chat $index");
          }),
    );
  }
}

class GroupChat extends StatelessWidget {
  const GroupChat({super.key, this.groupName = "Group Chat 1"});

  final String groupName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: ElevatedButton(
        onPressed: () => {print("Pressed")},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.secondary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.group,
                size: 100,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              Text(
                groupName,
                style: TextStyle(
                    fontSize: 21.6,
                    color: Theme.of(context).colorScheme.onSurface),
              )
            ],
          ),
        ),
      ),
    );
  }
}
