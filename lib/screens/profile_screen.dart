import 'package:flutter/material.dart';
import 'package:giftbox/features/profileview/edit_profile_button.dart';
import 'package:giftbox/viewmodel/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../features/profileview/index.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: profileViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : const SingleChildScrollView(
              // Wrap Column with SingleChildScrollView
              child: Column(
                children: [
                  ProfilAvatarPromoCard(),
                  SizedBox(height: 60),
                  EditButton(),
                  SizedBox(height: 30),
                  OptionList(),
                ],
              ),
            ),
    );
  }
}
