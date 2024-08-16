import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
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
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                    'lib/assets/user.png'), // Replace with the actual image path
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Emre Çiftci',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
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
