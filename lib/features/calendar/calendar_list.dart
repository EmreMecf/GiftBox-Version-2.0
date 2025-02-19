import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/index.dart';

class CalendarList extends StatelessWidget {
  const CalendarList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarViewModel = context.watch<CalendarViewModel>();

    return ListView.builder(
      shrinkWrap: true,
      // Boyutu sınırlamak için
      physics: const NeverScrollableScrollPhysics(),
      // Kaydırmayı devre dışı bırakıyoruz
      itemCount: calendarViewModel.birthdays.length,
      itemBuilder: (context, index) {
        final birthday = calendarViewModel.birthdays[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(
              birthday.name,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color),
            ),
            subtitle: Text(
              birthday.date.toLocal().toString().split(' ')[0],
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                calendarViewModel.removeBirthday(birthday);
              },
            ),
          ),
        );
      },
    );
  }
}
