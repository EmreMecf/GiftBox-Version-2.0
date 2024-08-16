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
    final profileViewModel = context.read<ProfileViewModel>();
    profileViewModel.loadUserData();

    final userName = profileViewModel.userName ?? 'Kullanıcı Adı Yok';
    final userEmail = profileViewModel.userEmail ?? 'Email Yok';

    if (profileViewModel.isLoading) {
      return const CircularProgressIndicator(); // or some placeholder widget
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
        const Positioned(
          top: 50,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('lib/assets/user.png'),
          ),
        ),
        Positioned(
          top: 180,
          child: Column(
            children: [
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                userEmail,
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
