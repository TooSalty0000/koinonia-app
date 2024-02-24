// Grouped and sorted imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koinonia/core/themes/app_theme.dart';
import 'package:koinonia/features/login-feature/presentation/common/view/AuthViewModel.dart';
import 'package:koinonia/injection_container.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './core/config/supabase_config.dart'; // Assumes you moved Supabase init here
import './core/router/app_router.dart'; // Assumes you define your routes here

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSupabase(); // Supabase initialization moved to a separate function
  await initializeDependencies(); // Dependency initialization moved to a separate function
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) =>
                sl<AuthBloc>()), // AuthBloc moved to a separate file
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: getTheme(),
        initialRoute: '/',
        onGenerateRoute: AppRouter.generateRoute,
        // Removed navigatorKey as we're now using context for navigation
      ),
    );
  }
}

class Starter extends StatefulWidget {
  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  void initState() {
    super.initState();
    _setupAuthListener();
  }

  Future<void> _setupAuthListener() async {
    final client = Supabase.instance.client;

    // Listening to the auth state changes
    client.auth.onAuthStateChange.listen((data) async {
      final event = data.event;
      if (event == AuthChangeEvent.signedOut) {
        print('User signed out.');
        // Check if the widget is still mounted before navigating
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/login-loggedOut',
              arguments: 'loggedOut');
        }
      }
    });

    // // Introduce a 1-second delay
    // await Future.delayed(const Duration(seconds: 1));

    // Make sure to check if the widget is still mounted before navigating
    if (!mounted) return;

    if (client.auth.currentSession != null) {
      Navigator.pushReplacementNamed(context, '/index');
    } else {
      Navigator.pushReplacementNamed(context, '/login-starter',
          arguments: 'fromStarter');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Potentially a splash screen or initial loading screen
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
