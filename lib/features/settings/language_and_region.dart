import 'package:flutter/material.dart';

class LanguageAndRegionWidget extends StatelessWidget {
  const LanguageAndRegionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final region = locale.countryCode ?? 'Unknown';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: const Text('Dil', style: TextStyle(fontSize: 18)),
          trailing: Text(locale.languageCode == 'tr' ? 'Türkçe' : 'English'),
        ),
        ListTile(
          title: const Text('Bölge', style: TextStyle(fontSize: 18)),
          trailing: Text(region),
        ),
      ],
    );
  }
}
