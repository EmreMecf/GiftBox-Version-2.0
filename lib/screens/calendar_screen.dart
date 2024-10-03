import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../features/calendar/index.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.calender_screen_app_bar_label),
      ),
      body: const SingleChildScrollView(
        // Kaydırılabilir ekran ekliyoruz
        child: Column(
          mainAxisSize: MainAxisSize.min, // Minimum boyut ayarı
          children: [
            CalendarWidget(),
            SizedBox(height: 20),
            CalendarInputForm(),
            SizedBox(height: 20),
            // ListView'i Expanded ile sarmalayarak boyutlandırıyoruz
            CalendarList(),
          ],
        ),
      ),
    );
  }
}
