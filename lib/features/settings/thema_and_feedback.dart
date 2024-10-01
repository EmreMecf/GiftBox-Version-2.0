import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          title: Text(AppLocalizations.of(context)!.setting_thema_label),
          onTap: () {
            settingsViewModel.goToThemeSettings();
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.feedback),
          title: Text(AppLocalizations.of(context)!.setting_feedback_label),
          onTap: () {
            settingsViewModel.goToFeedback();
          },
        ),
      ],
    );
  }
}
