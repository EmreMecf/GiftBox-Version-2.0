import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/index.dart';

class FeedbackError extends StatelessWidget {
  const FeedbackError({super.key});

  @override
  Widget build(BuildContext context) {
    final errorViewModel = context.watch<ErrorViewModel>();

    if (!errorViewModel.hasError) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        errorViewModel.errorMessage,
        style: const TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }
}
