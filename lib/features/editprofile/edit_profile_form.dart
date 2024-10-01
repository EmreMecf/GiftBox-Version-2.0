import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/index.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final profileViewModel = context.read<ProfileViewModel>();
    _nameController = TextEditingController(text: profileViewModel.userName);
    _emailController = TextEditingController(text: profileViewModel.userEmail);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final updateProfileViewModel = context.watch<UpdateProfileViewModel>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.edit_profile_name_label,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Bu alanı doldurun';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText:
                  AppLocalizations.of(context)!.edit_profile_eposta_label,
              border: const OutlineInputBorder(),
            ),
            readOnly: true,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: updateProfileViewModel.isLoading
                ? null
                : () async {
                    if (_formKey.currentState!.validate()) {
                      await updateProfileViewModel
                          .updateDisplayName(_nameController.text);
                    }
                  },
            child: updateProfileViewModel.isLoading
                ? const CircularProgressIndicator()
                : Text(
                    AppLocalizations.of(context)!.edit_profile_submit_button),
          ),
          if (updateProfileViewModel.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                updateProfileViewModel.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
