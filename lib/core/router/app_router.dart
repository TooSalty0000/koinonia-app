// Example of a router class for named route management
import 'package:flutter/material.dart';
import 'package:koinonia/features/login-feature/presentation/login/Loginpage.dart';
import 'package:koinonia/features/login-feature/presentation/register/RegisterPage.dart';
import 'package:koinonia/main.dart';
import 'package:koinonia/features/home-feature/presentation/Indexpage.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Starter());
      case '/index':
        return MaterialPageRoute(builder: (_) => const IndexPage());
      case '/login-starter':
        // Transition for navigating from Starter to Login
        return MaterialPageRoute(builder: (_) => const IndexPage());
      case '/login-loggedOut':
        // Transition for navigating to Login after logout
        return _createSlideRightRoute(const LoginPage(), settings.name!);
      case '/login':
        // Default transition for the Login page
        return _createFadeRoute(const LoginPage(), settings.name!);
      case '/register':
        return _createFadeRoute(const RegisterPage(), settings.name!);
      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: Center(child: Text('Not Found'))));
    }
  }

  static PageRouteBuilder _createFadeRoute(Widget page, String routeName) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      settings: RouteSettings(name: routeName),
    );
  }

  static PageRouteBuilder _createSlideLeftRoute(Widget page, String routeName) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      settings: RouteSettings(name: routeName),
    );
  }

  static PageRouteBuilder _createSlideRightRoute(
      Widget page, String routeName) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      settings: RouteSettings(name: routeName),
    );
  }
}
