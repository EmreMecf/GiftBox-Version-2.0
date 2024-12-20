import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'lib/assets/logo.png', // Logo dosya yolu
        height: 100, // Logo yüksekliği
        fit: BoxFit.contain, // Logo'nun boyutlandırılması
      ),
    );
  }
}
