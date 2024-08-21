import 'package:flutter/material.dart';

import '../features/settings/index.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Düzenle'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThemeAndFeedbackWidget(),
            SizedBox(height: 20),
            LanguageAndRegionWidget(),
          ],
        ),
      ),
    );
  }
}
