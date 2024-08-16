import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class OptionList extends StatelessWidget {
  const OptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signOutViewModel = context.watch<SignOutViewModel>();

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Ayarlar'),
          onTap: () {},
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
