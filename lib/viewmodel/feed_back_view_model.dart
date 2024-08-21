import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'index.dart';

class FeedbackViewModel with ChangeNotifier {
  final ErrorViewModel _errorViewModel;

  FeedbackViewModel(this._errorViewModel);

  void onGmailPressed() async {
    final Uri emailUrl = Uri(
      scheme: 'mailto',
      path: 'destek@ornekdomain.com',
      queryParameters: {
        'subject': 'Uygulama Geri Bildirim',
        'body': 'Merhaba, uygulamanız hakkında geri bildirim vermek istiyorum.'
      },
    );

    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl);
    } else {
      _errorViewModel.setError("Gmail açılamadı.");
    }
  }

  void onGoogleStorePressed() async {
    final String packageName = "com.ornekdomain.uygulama";
    final Uri playStoreUrl =
        Uri.parse("https://play.google.com/store/apps/details?id=$packageName");

    if (await canLaunchUrl(playStoreUrl)) {
      await launchUrl(playStoreUrl);
    } else {
      _errorViewModel.setError("Google Play Store açılamadı.");
    }
  }
}
