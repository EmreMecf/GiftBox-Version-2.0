import 'package:flutter/material.dart';

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

  final Map<String, List<String>> _categoryInterests = const {
    'Eğlence': ['Masa Oyunu', 'Video Oyunu', 'Kart Oyunu', 'Film/Dizi'],
    'Müzik': ['Gitar', 'Davul', 'Plak', 'Rap', 'Pop'],
    'Teknoloji': ['Yapay Zeka', 'Programlama', 'Donanım'],
    'Spor': ['Futbol', 'Basketbol', 'Yüzme'],
    'Moda': ['Giyim', 'Ayakkabı', 'Aksesuar'],
  };

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
            Container(
              child: Text(
                'İlgi Alanları',
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: _categoryInterests.keys.map((category) {
                return GestureDetector(
                  onTap: () => onCategoryChanged(category),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: selectedCategory == category
                          ? theme.primaryColor
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedCategory == category
                            ? Colors.white
                            : Colors.black, // Seçili kategoriye göre renk
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: _categoryInterests[selectedCategory]!.map((interest) {
                return FilterChip(
                  label: Text(
                    interest,
                    style: TextStyle(
                      color: selectedInterests.contains(interest)
                          ? Colors.white
                          : Colors.black, // Seçili ise beyaz, değilse siyah
                    ),
                  ),
                  selected: selectedInterests.contains(interest),
                  onSelected: (selected) => onInterestToggled(interest),
                  backgroundColor: Colors.grey[200],
                  selectedColor: theme.primaryColor,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
