import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/viewmodel/profile_view_model.dart';
import 'package:giftbox/viewmodel/update_profile_image_view_model.dart';
import 'package:provider/provider.dart';

class EditProfilePhoto extends StatelessWidget {
  const EditProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.watch<ProfileViewModel>();
    final updateProfileImageViewModel =
        Provider.of<UpdateProfileImageViewModel>(context, listen: false);

    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: profileViewModel.userPhoto != null
              ? NetworkImage(profileViewModel.userPhoto!)
              : const AssetImage('lib/assets/user.png') as ImageProvider,
        ),
        TextButton(
          onPressed: () async {
            // ViewModel'den izin kontrolünü ve fotoğraf seçimini başlat
            await updateProfileImageViewModel.selectImageWithPermission();

            // Eğer resim seçildiyse ve yüklendiyse
            if (updateProfileImageViewModel.selectedImage != null) {
              await updateProfileImageViewModel
                  .uploadImageAndUpdateProfile(profileViewModel.userId!);

              // Profil view modelini güncelle
              await profileViewModel.loadUserData();
            }
          },
          child: Text(
              AppLocalizations.of(context)!.edit_profile_photo_change_label),
        ),
      ],
    );
  }
}
