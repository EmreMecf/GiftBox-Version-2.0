import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgeSection extends StatelessWidget {
  final double age;
  final Function(double value) onChanged;

  const AgeSection({Key? key, required this.age, required this.onChanged})
      : super(key: key);

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
            Text(AppLocalizations.of(context)!.category_age_heading,
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Slider(
              value: age,
              min: 0,
              max: 100,
              divisions: 100,
              label: age.round().toString(),
              onChanged: onChanged,
              activeColor: theme.primaryColor,
              inactiveColor: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            Text(
                '${AppLocalizations.of(context)!.category_age_little_title} ${age.round()}',
                style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
