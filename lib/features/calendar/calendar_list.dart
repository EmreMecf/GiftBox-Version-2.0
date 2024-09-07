import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/index.dart';

class CalendarList extends StatelessWidget {
  const CalendarList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarViewModel = context.watch<CalendarViewModel>();

    return Expanded(
      child: ListView.builder(
        itemCount: calendarViewModel.birthdays.length,
        itemBuilder: (context, index) {
          final birthday = calendarViewModel.birthdays[index];
          return ListTile(
            title: Text(birthday.name),
            subtitle: Text(
              birthday.date.toLocal().toString().split(' ')[0],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                calendarViewModel.removeBirthday(birthday);
              },
            ),
          );
        },
      ),
    );
  }
}
