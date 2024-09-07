import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (name) {
              if (name.isNotEmpty) {
                calendarViewModel.addBirthday(name);
                nameController.clear(); // Giriş sonrası alanı temizle
              }
            },
          ),
        ],
      ),
    );
  }
}
