import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class ThemeAndFeedbackWidget extends StatelessWidget {
  const ThemeAndFeedbackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsViewModel = context.read<SettingsViewModel>();
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.format_paint),
          title: const Text('Tema Ayarları'),
          onTap: () {
            // Handle theme settings tap
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.feedback),
          title: const Text('Geri Bildirim'),
          onTap: () {
            settingsViewModel.goToFeedback();
          },
        ),
      ],
    );
  }
}
