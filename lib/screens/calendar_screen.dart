import 'package:flutter/material.dart';

import '../features/calendar/index.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birthday Calendar'),
      ),
      body: const Column(
        children: [
          CalendarWidget(),
          SizedBox(height: 20),
          CalendarInputForm(),
          SizedBox(height: 20),
          CalendarList(),
        ],
      ),
    );
  }
}
