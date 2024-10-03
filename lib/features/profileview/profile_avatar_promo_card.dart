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
      return const Center(child: CircularProgressIndicator());
    }

    final theme = Theme.of(context); // Temayı al

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(profileViewModel.userPhoto!),
          ),
          const SizedBox(height: 16), // Avatar ile metin arasında boşluk
          // İsim
          Text(
            profileViewModel.userName!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme
                  .colorScheme.onSurface, // Temadan yüzey üzerindeki rengi al
            ),
          ),
          const SizedBox(height: 8), // İsim ile e-posta arasında boşluk
          // E-posta
          Text(
            profileViewModel.userEmail!,
            style: TextStyle(
              fontSize: 16,
              color: theme.colorScheme
                  .onSurfaceVariant, // Temadan yüzey üzerindeki varyant rengi al
            ),
          ),
        ],
      ),
    );
  }
}
