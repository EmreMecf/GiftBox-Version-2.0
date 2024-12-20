import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class OptionList extends StatelessWidget {
  const OptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signOutViewModel = context.read<SignOutViewModel>();
    final profileRouteViewModel = context.read<ProfileRouteViewModel>();
    final theme = Theme.of(context); // Temayı al

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(AppLocalizations.of(context)!.profile_menu_ayarlar),
          onTap: () {
            profileRouteViewModel.goToSettings();
          },
        ),
        const Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: Text(AppLocalizations.of(context)!.profile_menu_cikis),
          onTap: () {
            signOutViewModel.signOut();
          },
        ),
      ],
    );
  }
}
