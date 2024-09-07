import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../viewmodel/index.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarViewModel = context.watch<CalendarViewModel>();

    return TableCalendar(
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: calendarViewModel.focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(calendarViewModel.selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        calendarViewModel.onDaySelected(selectedDay, focusedDay);
      },
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
