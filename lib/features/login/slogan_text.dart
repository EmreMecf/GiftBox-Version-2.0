import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SloganText extends StatelessWidget {
  const SloganText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.login_screen_slogan_label,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.grey[600], // Daha yumuşak bir renk tonu
          ),
      textAlign: TextAlign.center, // Metni ortala
    );
  }
}
