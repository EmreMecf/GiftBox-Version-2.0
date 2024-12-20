import 'package:flutter/material.dart';

import '../services/models/index.dart';

class CalendarViewModel with ChangeNotifier {
  final List<Birthday> _birthdays = [];
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Birthday> get birthdays => _birthdays;

  DateTime get focusedDay => _focusedDay;

  DateTime? get selectedDay => _selectedDay;

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _selectedDay = selectedDay;
    _focusedDay = focusedDay;
    notifyListeners();
  }

  void addBirthday(String name) {
    if (_selectedDay != null) {
      final newBirthday = Birthday(name: name, date: _selectedDay!);
      _birthdays.add(newBirthday);
      notifyListeners();
      scheduleNotification(newBirthday);
    }
  }

  void removeBirthday(Birthday birthday) {
    _birthdays.remove(birthday);
    notifyListeners();
    cancelNotification(birthday);
  }

  void scheduleNotification(Birthday birthday) {
    // Bildirim planlamasını buraya ekleyin
  }

  void cancelNotification(Birthday birthday) {
    // Bildirimin iptal edilmesini buraya ekleyin
  }
}
