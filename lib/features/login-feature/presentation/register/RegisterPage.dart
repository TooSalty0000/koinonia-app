import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koinonia/features/login-feature/presentation/common/widgets/CustomTextInput.dart';
import 'package:koinonia/features/login-feature/presentation/common/view/AuthViewModel.dart';
import 'package:koinonia/features/login-feature/presentation/common/widgets/DividerWithText.dart';
import 'package:koinonia/features/login-feature/presentation/common/widgets/LoginButton.dart';
import 'package:koinonia/features/login-feature/presentation/common/widgets/LoginHeader.dart';
import 'package:koinonia/features/login-feature/presentation/common/widgets/SocialSignInButtons.dart';
import 'package:koinonia/features/login-feature/presentation/register/widgets/SignInPrompt.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _onSignInWithGoogle() async {
    BlocProvider.of<AuthBloc>(context).add(SignInWithGoogleEvent());
  }

  void _onSignUpWithPassword() async {
    BlocProvider.of<AuthBloc>(context).add(
        SignUpWithPasswordEvent(emailController.text, passwordController.text));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
          // Handle other states if necessaryㄲ
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
                CustomTextInput(hintText: "이메일", controller: emailController),
                CustomTextInput(
                    hintText: "비밀번호",
                    isPassword: true,
                    controller: passwordController),
                CustomTextInput(
                    hintText: "비밀번호 확인",
                    isPassword: true,
                    controller: confirmPasswordController),
                LoginPageButton(
                  buttonText: "회원가입",
                  onButtonPressed: () {
                    _onSignUpWithPassword();
                  },
                ),
                const DividerWithText(
                    text: 'or'), // Reuse this widget if applicable
                SocialSignInButtons(
                  onGoogleSignIn: () async {
                    _onSignInWithGoogle();
                  },
                  onAppleSignIn: () {
                    // Handle Apple Sign-In
                  },
                  onKakaoTalkSignIn: () {
                    // Handle KakaoTalk Sign-In
                  },
                ),
                const SignInPrompt(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
