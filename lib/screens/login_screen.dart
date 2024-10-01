import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.watch<SignInViewModel>();
    return Scaffold(
      appBar: AppBar(
          title:
              Text(AppLocalizations.of(context)!.login_screen_app_bar_label)),
      body: Consumer<SignInViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (signInViewModel.isLoading)
                  const CircularProgressIndicator(),
                if (signInViewModel.errorMessage != null)
                  Text(
                    signInViewModel.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    signInViewModel.signInWithGoogle();
                  },
                  child: const Text('Sign in with Google'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
