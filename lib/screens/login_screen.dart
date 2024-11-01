import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

import '../features/login/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.watch<SignInViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            const SizedBox(height: 20),
            const WelcomeText(),
            const SizedBox(height: 10),
            const SloganText(),
            const SizedBox(height: 30),
            if (signInViewModel.isLoading) const CircularProgressIndicator(),
            if (signInViewModel.errorMessage != null)
              Text(
                signInViewModel.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            SignInButton(onPressed: () {
              signInViewModel.signInWithGoogle();
            }),
          ],
        ),
      ),
    );
  }
}
