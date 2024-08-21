import 'package:flutter/material.dart';

import '../features/feedback/index.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geri Bildirim'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            FeedbackDescription(),
            SizedBox(height: 60),
            FeedbackButtons(),
            FeedbackError(),
          ],
        ),
      ),
    );
  }
}
