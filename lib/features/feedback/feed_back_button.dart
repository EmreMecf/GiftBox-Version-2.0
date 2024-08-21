import 'package:flutter/material.dart';

class FeedbackButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  const FeedbackButton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 26.0,
            ),
            Image.asset(
              imagePath,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 26.0),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
