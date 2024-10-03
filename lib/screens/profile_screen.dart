import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/viewmodel/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../features/index.dart';
import '../features/profileview/index.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileViewModel = context.read<ProfileViewModel>();
      profileViewModel.loadUserData();
    });
  }

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();

    return Scaffold(
      appBar: AppBar(
          title:
              Text(AppLocalizations.of(context)!.profile_screen_app_bar_label)),
      body: profileViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : const SingleChildScrollView(
              // Wrap Column with SingleChildScrollView
              child: Column(
                children: [
                  SizedBox(height: 50),
                  ProfilAvatarPromoCard(),
                  SizedBox(height: 10),
                  EditButton(),
                  SizedBox(height: 30),
                  OptionList(),
                ],
              ),
            ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onNavBarTap: _onNavBarTap,
      ),
    );
  }
}
