import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/index.dart';

class CalendarInputForm extends StatelessWidget {
  const CalendarInputForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarViewModel = context.watch<CalendarViewModel>();
    final nameController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.calender_input_form_label,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              final name = nameController.text.trim();
              if (name.isNotEmpty) {
                calendarViewModel.addBirthday(name);
                nameController.clear(); // Giriş sonrası alanı temizle
              }
            },
          ),
        ),
        style: TextStyle(
            color: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.color), // Temaya uygun yazı rengi
      ),
    );
  }
}
