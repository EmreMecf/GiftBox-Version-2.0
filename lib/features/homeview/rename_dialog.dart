import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/services/repositories/firebase_firestore_repository.dart';
import 'package:provider/provider.dart';

class RenameDialog extends StatelessWidget {
  final String messageId; // Mesaj ID'si
  final String currentTitle; // Mevcut başlık

  const RenameDialog(
      {Key? key, required this.messageId, required this.currentTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        TextEditingController(text: currentTitle);
    final firebaseFirestoreRepository =
        context.read<FirebaseFirestoreRepository>();

    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.rename_dialog_heading_label),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.rename_dialog_hint_label),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(AppLocalizations.of(context)!.rename_dialog_cancel_label),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(AppLocalizations.of(context)!.rename_dialog_save_label),
          onPressed: () async {
            final newTitle = _controller.text;
            if (newTitle.isNotEmpty) {
              await firebaseFirestoreRepository.updateMessageTitle(
                  messageId, newTitle);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
