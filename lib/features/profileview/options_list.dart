import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class OptionList extends StatelessWidget {
  const OptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signOutViewModel = context.read<SignOutViewModel>();
    final profileRouteViewModel = context.read<ProfileRouteViewModel>();

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Ayarlar'),
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
          title: const Text('Log out'),
          onTap: () {
            signOutViewModel.signOut();
          },
        ),
      ],
    );
  }
}
