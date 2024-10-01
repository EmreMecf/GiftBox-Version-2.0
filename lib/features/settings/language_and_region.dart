import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          title: Text(AppLocalizations.of(context)!.settings_leangue_label,
              style: TextStyle(fontSize: 18)),
          trailing: Text(locale.languageCode == 'tr' ? 'Türkçe' : 'English'),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.setting_region_label,
              style: TextStyle(fontSize: 18)),
          trailing: Text(region),
        ),
      ],
    );
  }
}
