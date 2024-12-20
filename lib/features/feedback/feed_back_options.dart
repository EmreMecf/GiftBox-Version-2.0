import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/index.dart';
import 'feed_back_button.dart';

class FeedbackButtons extends StatelessWidget {
  const FeedbackButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final feedbackViewModel = context.watch<FeedbackViewModel>();

    return Column(
      children: [
        FeedbackButton(
          onPressed: feedbackViewModel.onGmailPressed,
          imagePath: 'lib/assets/gmail.png',
          text: 'Gmail',
        ),
        const SizedBox(height: 15),
        FeedbackButton(
          onPressed: feedbackViewModel.onGoogleStorePressed,
          imagePath: 'lib/assets/google-play.png',
          text: 'Google Play Store',
        ),
      ],
    );
  }
}
