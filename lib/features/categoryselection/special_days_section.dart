import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpecialDaysSection extends StatelessWidget {
  final String specialDay;
  final Function(String value) onChanged;

  const SpecialDaysSection({
    Key? key,
    required this.specialDay,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.category_special_days_heading,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => onChanged(AppLocalizations.of(context)!
                      .category_special_days_anneler_gunu),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: specialDay ==
                            AppLocalizations.of(context)!
                                .category_special_days_anneler_gunu
                        ? Colors.white
                        : theme.primaryColor,
                    backgroundColor: specialDay ==
                            AppLocalizations.of(context)!
                                .category_special_days_anneler_gunu
                        ? theme.primaryColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  child: Text(AppLocalizations.of(context)!
                      .category_special_days_anneler_gunu),
                ),
                ElevatedButton(
                  onPressed: () => onChanged(AppLocalizations.of(context)!
                      .category_special_days_babalar_gunu),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: specialDay ==
                            AppLocalizations.of(context)!
                                .category_special_days_babalar_gunu
                        ? Colors.white
                        : theme.primaryColor,
                    backgroundColor: specialDay ==
                            AppLocalizations.of(context)!
                                .category_special_days_babalar_gunu
                        ? theme.primaryColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  child: Text(AppLocalizations.of(context)!
                      .category_special_days_babalar_gunu),
                ),
                ElevatedButton(
                  onPressed: () => onChanged(AppLocalizations.of(context)!
                      .category_special_days_dogum_gunu),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: specialDay ==
                            AppLocalizations.of(context)!
                                .category_special_days_dogum_gunu
                        ? Colors.white
                        : theme.primaryColor,
                    backgroundColor: specialDay ==
                            AppLocalizations.of(context)!
                                .category_special_days_dogum_gunu
                        ? theme.primaryColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  child: Text(AppLocalizations.of(context)!
                      .category_special_days_dogum_gunu),
                ),
                ElevatedButton(
                  onPressed: () => onChanged(AppLocalizations.of(context)!
                      .category_special_days_sevililer_gunu),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: specialDay ==
                            AppLocalizations.of(context)!
                                .category_special_days_sevililer_gunu
                        ? Colors.white
                        : theme.primaryColor,
                    backgroundColor: specialDay ==
                            AppLocalizations.of(context)!
                                .category_special_days_sevililer_gunu
                        ? theme.primaryColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  child: Text(AppLocalizations.of(context)!
                      .category_special_days_sevililer_gunu),
                ),
                ElevatedButton(
                  onPressed: () => onChanged(AppLocalizations.of(context)!
                      .category_special_days_yilbasi),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: specialDay ==
                            AppLocalizations.of(context)!
                                .category_special_days_yilbasi
                        ? Colors.white
                        : theme.primaryColor,
                    backgroundColor: specialDay ==
                            AppLocalizations.of(context)!
                                .category_special_days_yilbasi
                        ? theme.primaryColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  child: Text(AppLocalizations.of(context)!
                      .category_special_days_yilbasi),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
