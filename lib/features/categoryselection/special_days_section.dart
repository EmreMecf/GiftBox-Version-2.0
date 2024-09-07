import 'package:flutter/material.dart';

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
            Text(
              'Özel Günler',
              style: theme.textTheme.headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8, // Butonlar arasındaki yatay boşluk
              children: [
                ElevatedButton(
                  onPressed: () => onChanged('Anneler Günü'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: specialDay == 'Anneler Günü'
                        ? Colors.white
                        : theme.primaryColor,
                    backgroundColor: specialDay == 'Anneler Günü'
                        ? theme.primaryColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  child: const Text('Anneler Günü'),
                ),
                ElevatedButton(
                  onPressed: () => onChanged('Babalar Günü'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: specialDay == 'Babalar Günü'
                        ? Colors.white
                        : theme.primaryColor,
                    backgroundColor: specialDay == 'Babalar Günü'
                        ? theme.primaryColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  child: const Text('Babalar Günü'),
                ),
                ElevatedButton(
                  onPressed: () => onChanged('Doğum Günü'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: specialDay == 'Doğum Günü'
                        ? Colors.white
                        : theme.primaryColor,
                    backgroundColor: specialDay == 'Doğum Günü'
                        ? theme.primaryColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  child: const Text('Doğum Günü'),
                ),
                ElevatedButton(
                  onPressed: () => onChanged('Sevgililer Günü'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: specialDay == 'Sevgililer Günü'
                        ? Colors.white
                        : theme.primaryColor,
                    backgroundColor: specialDay == 'Sevgililer Günü'
                        ? theme.primaryColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  child: const Text('Sevgililer Günü'),
                ),
                ElevatedButton(
                  onPressed: () => onChanged('Yılbaşı'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: specialDay == 'Yılbaşı'
                        ? Colors.white
                        : theme.primaryColor,
                    backgroundColor: specialDay == 'Yılbaşı'
                        ? theme.primaryColor
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  child: const Text('Yılbaşı'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
