import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenderSection extends StatelessWidget {
  final String gender;
  final Function(String?) onChanged;

  const GenderSection({
    Key? key,
    required this.gender,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Temayı al

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.category_gender_heading,
                style: theme.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: RadioListTile<String>(
                title: Text(
                    AppLocalizations.of(context)!.category_gender_erkek_label),
                value:
                    AppLocalizations.of(context)!.category_gender_erkek_value,
                groupValue: gender,
                onChanged: onChanged,
              )),
              Expanded(
                  child: RadioListTile<String>(
                title: Text(
                    AppLocalizations.of(context)!.category_gender_kadin_label),
                value:
                    AppLocalizations.of(context)!.category_gender_kadin_value,
                groupValue: gender,
                onChanged: onChanged,
              )),
            ]),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: RadioListTile<String>(
                title: Text(
                    AppLocalizations.of(context)!.category_gender_cocuk_label),
                value:
                    AppLocalizations.of(context)!.category_gender_cocuk_value,
                groupValue: gender,
                onChanged: onChanged,
              )),
              Expanded(
                  child: RadioListTile<String>(
                title: Text(
                    AppLocalizations.of(context)!.category_gender_diger_label),
                value:
                    AppLocalizations.of(context)!.category_gender_diger_value,
                groupValue: gender,
                onChanged: onChanged,
              )),
            ]),
          ],
        ),
      ),
    );
  }
}
