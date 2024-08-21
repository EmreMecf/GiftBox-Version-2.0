import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/profile_view_model.dart';
import 'package:provider/provider.dart';

class EditProfilePhoto extends StatelessWidget {
  const EditProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.watch<ProfileViewModel>();

    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(profileViewModel.userPhoto!),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Fotoğraf Değiştir'),
        ),
      ],
    );
  }
}
