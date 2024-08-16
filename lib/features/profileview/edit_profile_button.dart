import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
      child: const Text(
        "Edit Profile",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
