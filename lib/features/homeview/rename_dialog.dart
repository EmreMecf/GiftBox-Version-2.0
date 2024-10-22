import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class RenameDialog extends StatelessWidget {
  final String messageId;
  final String currentTitle;

  const RenameDialog(
      {Key? key, required this.messageId, required this.currentTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        TextEditingController(text: currentTitle);
    final messageTitleRenameViewModel =
        context.read<MessageTitleRenameViewModel>();

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
              // Yeni başlığı güncelle
              await messageTitleRenameViewModel.updateMessageTitle(
                  messageId, newTitle);

              // Başarı veya hata durumuna göre toast mesajını göster
              final errorViewModel = context.read<ErrorViewModel>();
              if (errorViewModel.hasError) {
                Fluttertoast.showToast(
                  msg: errorViewModel.errorMessage,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                );
              } else {
                Fluttertoast.showToast(
                  msg: errorViewModel.successMessage,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                );
              }
              // Mesajlar temizlenir ve dialog kapanır
              errorViewModel.clearMessages();
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
