import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class ThemeToggleWidget extends StatelessWidget {
  const ThemeToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Dark Mode',
          style: TextStyle(fontSize: 18),
        ),
        Switch(
          value: themeViewModel.themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeViewModel.toggleTheme(value);
          },
        ),
      ],
    );
  }
}
