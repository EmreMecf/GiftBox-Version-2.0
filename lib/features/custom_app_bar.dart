import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
    final profileViewModel = context.watch<ProfileViewModel>();
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16.0)),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                homeViewModel.goToProfile();
              },
              child: CircleAvatar(
                radius: 20,
                backgroundImage: profileViewModel.userPhoto != null
                    ? NetworkImage(profileViewModel.userPhoto!)
                    : const AssetImage('lib/assets/user.png') as ImageProvider,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profileViewModel.userName!,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
