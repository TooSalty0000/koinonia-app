import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koinonia/features/login-feature/presentation/common/view/AuthViewModel.dart';
import 'package:koinonia/features/login-feature/presentation/common/widgets/CustomTextInput.dart';
import 'package:koinonia/features/login-feature/presentation/common/widgets/DividerWithText.dart';
import 'package:koinonia/features/login-feature/presentation/common/widgets/LoginButton.dart';
import 'package:koinonia/features/login-feature/presentation/common/widgets/LoginHeader.dart';
import 'package:koinonia/features/login-feature/presentation/common/widgets/SocialSignInButtons.dart';
import 'package:koinonia/features/login-feature/presentation/login/widgets/CreateAccountPrompt.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _onSignInWithGoogle() {
    BlocProvider.of<AuthBloc>(context).add(SignInWithGoogleEvent());
  }

  void _onSignInWithPassword() {
    BlocProvider.of<AuthBloc>(context).add(
      SignInWithPasswordEvent(emailController.text, passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            Navigator.pushReplacementNamed(context, '/index');
          } else if (state is AuthErrorState) {
            // Show error message
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          // Handle other states if necessary
        },
        child: SingleChildScrollView(
          child: Container(
            width: 393,
            height: 852,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.21, -0.98),
                end: Alignment(0.21, 0.98),
                colors: [Color(0xFF9C6954), Color(0xFFE8DAD5)],
              ),
            ),
            child: Column(
              children: [
                const LoginHeader(),
                Padding(padding: const EdgeInsets.all(28.0)),
                CustomTextInput(
                  hintText: "Email",
                  isPassword: false,
                  controller: emailController,
                ),
                CustomTextInput(
                  hintText: "Password",
                  isPassword: true,
                  controller: passwordController,
                ),
                LoginPageButton(
                  buttonText: "로그인",
                  onButtonPressed: _onSignInWithPassword,
                ),
                const DividerWithText(text: 'or'),
                SocialSignInButtons(
                  onGoogleSignIn: _onSignInWithGoogle,
                  onAppleSignIn: () {
                    // Handle Apple Sign-In
                  },
                  onKakaoTalkSignIn: () {
                    // Handle KakaoTalk Sign-In
                  },
                ),
                const CreateAccountPrompt(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
