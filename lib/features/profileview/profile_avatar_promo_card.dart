import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfilAvatarPromoCard extends StatefulWidget {
  const ProfilAvatarPromoCard({super.key});

  @override
  State<ProfilAvatarPromoCard> createState() => _ProfilAvatarPromoCardState();
}

class _ProfilAvatarPromoCardState extends State<ProfilAvatarPromoCard> {
  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.watch<ProfileViewModel>();

    if (profileViewModel.isLoading) {
      return const CircularProgressIndicator();
    }
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 180,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Positioned(
          top: 50,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(profileViewModel.userPhoto!),
          ),
        ),
        Positioned(
          top: 180,
          child: Column(
            children: [
              Text(
                profileViewModel.userName!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                profileViewModel.userEmail!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
