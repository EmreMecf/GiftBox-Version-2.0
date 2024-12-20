import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageAndRegionWidget extends StatefulWidget {
  const LanguageAndRegionWidget({Key? key}) : super(key: key);

  @override
  _LanguageAndRegionWidgetState createState() =>
      _LanguageAndRegionWidgetState();
}

class _LanguageAndRegionWidgetState extends State<LanguageAndRegionWidget> {
  String _selectedLanguage = 'en'; // Varsayılan dil İngilizce
  final List<String> _languages = ['tr', 'en']; // Desteklenen diller

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
          trailing: DropdownButton<String>(
            value: _selectedLanguage,
            items: _languages.map((String language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Text(language == 'tr' ? 'Türkçe' : 'English'),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedLanguage = newValue!;
                // Burada dil değişikliğini uygulamak için gerekli kodu ekleyin
                // Örneğin, uygulama yeniden başlatılabilir veya Locale değiştirilebilir.
              });
            },
          ),
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
