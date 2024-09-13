import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../viewmodel/index.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarViewModel = context.watch<CalendarViewModel>();

    return TableCalendar(
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: calendarViewModel.focusedDay,
      selectedDayPredicate: (day) =>
          isSameDay(calendarViewModel.selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        calendarViewModel.onDaySelected(selectedDay, focusedDay);
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor, // Temadan alınan renk
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary, // Temadan alınan renk
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
