// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/Homepage.dart';
import 'pages/Accountpage.dart';

void main() {
  runApp(MaterialApp(
    theme: getTheme(),
    home: const IndexPage(),
  ));
}

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int pageIndex = 0;

  var mainpage = Padding(
    padding: const EdgeInsets.all(8.0),
    child: HomePage(),
  );

  var accountPage = Padding(
    padding: const EdgeInsets.all(8.0),
    child: AccountPage(),
  );

  changePage(index) {
    print("called");
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      backgroundColor: backgroundColor,
      body: [mainpage, accountPage][pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
        currentIndex: pageIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (value) => changePage(value),
      ),
    );
  }
}
