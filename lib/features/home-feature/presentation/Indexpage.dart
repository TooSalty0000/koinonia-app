// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:koinonia/features/biblereading-feature/presentation/BibleReadingPage.dart';
import 'package:koinonia/features/profile-feature/presentation/ProfilePage.dart';
import 'package:koinonia/pages/Homepage.dart';
import 'package:koinonia/features/login-feature/presentation/login/LoginPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum PageIndex { home, bible, account }

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  PageIndex _currentPage = PageIndex.home;

  final Map<PageIndex, Widget> _pages = {
    PageIndex.home: const HomePage(),
    PageIndex.bible: const BibleReadingPage(),
    PageIndex.account: AccountPage(),
  };

  final Map<PageIndex, String> _pageTitles = {
    PageIndex.home: "Home",
    PageIndex.bible: "Bible Reading",
    PageIndex.account: "Profile",
  };

  void _changePage(int index) {
    setState(() {
      _currentPage = PageIndex.values[index];
    });
  }

  @override
  void initState() {
    super.initState();
    _setupAuthListener();
  }

  void _setupAuthListener() {
    final client = Supabase.instance.client;
    client.auth.onAuthStateChange.listen((data) {
      if (data.event == AuthChangeEvent.signedOut && mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Supabase.instance.client.auth.currentUser == null
        ? const LoginPage()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                _pageTitles[_currentPage]!,
                style: const TextStyle(color: Colors.black, fontSize: 25.9),
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            body: _pages[_currentPage],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.book), label: "Bible"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Account"),
              ],
              backgroundColor: Theme.of(context).colorScheme.secondary,
              currentIndex: _currentPage.index,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              onTap: _changePage,
            ),
          );
  }
}
