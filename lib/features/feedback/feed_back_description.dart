import 'package:flutter/material.dart';

class FeedbackDescription extends StatelessWidget {
  const FeedbackDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Geri Bildirim',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Uygulamamızı begendiyseniz ya da iyileştirmemizi '
          'istediginiz bir nokta varsa, aşagıdaki kanallardan bize '
          'ulaşmaktan çekinmeyin',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
