import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InterestsSection extends StatelessWidget {
  final String selectedCategory;
  final List<String> selectedInterests;
  final Function(String category) onCategoryChanged;
  final Function(String interest) onInterestToggled;

  const InterestsSection({
    Key? key,
    required this.selectedCategory,
    required this.selectedInterests,
    required this.onCategoryChanged,
    required this.onInterestToggled,
  }) : super(key: key);

  // Kategorileri ve ilgi alanlarını AppLocalizations ile alma
  Map<String, List<String>> getCategoryInterests(AppLocalizations locale) {
    return {
      locale.category_entertainment: [
        locale.interest_board_game,
        locale.interest_video_game,
        locale.interest_card_game,
        locale.interest_movies,
      ],
      locale.category_music: [
        locale.interest_guitar,
        locale.interest_drum,
        locale.interest_vinyl,
        locale.interest_rap,
        locale.interest_pop,
      ],
      locale.category_technology: [
        locale.interest_ai,
        locale.interest_programming,
        locale.interest_hardware,
        locale.interest_phone,
        locale.interest_computer,
        locale.interest_drone,
        locale.interest_smart_watch,
      ],
      locale.category_sports: [
        locale.interest_football,
        locale.interest_basketball,
        locale.interest_swimming,
        locale.interest_volleyball,
        locale.interest_running,
        locale.interest_table_tennis,
      ],
      locale.category_fashion: [
        locale.interest_clothing,
        locale.interest_shoes,
        locale.interest_accessories,
        locale.interest_tshirt,
        locale.interest_shirt,
        locale.interest_sweatpants,
        locale.interest_pants,
        locale.interest_tie,
        locale.interest_watch,
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;
    final categoryInterests = getCategoryInterests(locale);

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
              locale.category_interest_heading,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: categoryInterests.keys.map((category) {
                return GestureDetector(
                  onTap: () => onCategoryChanged(category),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: selectedCategory == category
                          ? theme.colorScheme.primary
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedCategory == category
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children:
                  (categoryInterests[selectedCategory] ?? []).map((interest) {
                return FilterChip(
                  label: Text(
                    interest,
                    style: TextStyle(
                      color: selectedInterests.contains(interest)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  selected: selectedInterests.contains(interest),
                  onSelected: (selected) => onInterestToggled(interest),
                  backgroundColor: Colors.grey[200],
                  selectedColor: theme.colorScheme.primary,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
