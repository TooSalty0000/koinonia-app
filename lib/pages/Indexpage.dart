import 'package:flutter/material.dart';
import 'package:koinonia/pages/Accountpage.dart';
import 'package:koinonia/pages/Homepage.dart';
import 'package:koinonia/features/login-feature/presentation/login/Loginpage.dart';
import 'package:koinonia/core/themes/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int pageIndex = 0;

  var homePage = const Padding(
    padding: EdgeInsets.all(8.0),
    child: HomePage(),
  );

  var accountPage = const Padding(
    padding: EdgeInsets.all(8.0),
    child: AccountPage(),
  );

  mainPage(context, mainPage, accountPage, pageIndex) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      backgroundColor: backgroundColor,
      body: [mainPage, accountPage][pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
        currentIndex: pageIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (value) => changePage(value),
      ),
    );
  }

  changePage(index) {
    print("called");
    setState(() {
      pageIndex = index;
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
      final event = data.event;
      switch (event) {
        case AuthChangeEvent.signedOut:
          print('User signed out.');
          Navigator.pushReplacementNamed(context, '/login');
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Supabase.instance.client.auth.currentUser == null) {
      return LoginPage();
    }
    return mainPage(context, homePage, accountPage, pageIndex);
  }
}
