import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    final profilRouteViewModel = context.read<ProfileRouteViewModel>();
    return ElevatedButton(
      onPressed: () {
        profilRouteViewModel.goToEditProfile();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
      ),
      child: Text(
        AppLocalizations.of(context)!.profile_edit_button,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
