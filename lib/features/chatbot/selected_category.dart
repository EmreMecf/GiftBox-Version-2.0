import 'package:flutter/material.dart';
import 'package:giftbox/services/models/states/category_selection_model.dart';

class SelectedCategoriesWidget extends StatelessWidget {
  final CategorySelectionModel categorySelection;

  const SelectedCategoriesWidget({Key? key, required this.categorySelection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Seçilen Kategoriler",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary, // Temaya göre renk
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0, // Chip'ler arasında yatay boşluk
              runSpacing: 4.0, // Chip'ler arasında dikey boşluk
              children: [
                _buildCategoryChip(
                  "Bütçe: ${categorySelection.minBudget} - ${categorySelection.maxBudget}",
                  Icons.attach_money,
                  theme,
                ),
                _buildCategoryChip(
                  "Yaş: ${categorySelection.age}",
                  Icons.cake,
                  theme,
                ),
                _buildCategoryChip(
                  "Cinsiyet: ${categorySelection.gender}",
                  Icons.person,
                  theme,
                ),
                if (categorySelection.specialDay != null &&
                    categorySelection.specialDay!.isNotEmpty)
                  _buildCategoryChip(
                    "Özel Gün: ${categorySelection.specialDay}",
                    Icons.event,
                    theme,
                  ),
                if (categorySelection.interests != null &&
                    categorySelection.interests!.isNotEmpty)
                  for (var interest in categorySelection.interests!)
                    _buildCategoryChip(interest, Icons.star, theme),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData icon, ThemeData theme) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: theme.colorScheme.primary, // Temaya göre renk
        child: Icon(icon, color: Colors.white, size: 16),
      ),
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: theme.textTheme.bodyLarge?.color, // Temaya göre yazı rengi
        ),
      ),
      backgroundColor: theme.colorScheme.surface,
      // Temaya göre arka plan rengi
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
            color: theme.colorScheme.onSurface,
            width: 1), // Temaya göre kenar rengi
      ),
    );
  }
}
