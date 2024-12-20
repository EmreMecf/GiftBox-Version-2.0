import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        Text(
          AppLocalizations.of(context)!.thema_settings_label,
          style: const TextStyle(fontSize: 18),
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
