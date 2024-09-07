import 'package:flutter/material.dart';

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
            Text('Cinsiyet',
                style: theme.textTheme.headline6
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Erkek'),
                    value: 'Erkek',
                    groupValue: gender,
                    onChanged: onChanged,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Kadın'),
                    value: 'Kadın',
                    groupValue: gender,
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Çocuk'),
                    value: 'Çocuk',
                    groupValue: gender,
                    onChanged: onChanged,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Diger'),
                    value: 'Diger',
                    groupValue: gender,
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
