import 'package:flutter/material.dart';

class AiMessage extends StatelessWidget {
  final String message;

  const AiMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Temayı al

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      // Yatay boşluk ekledik
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary, // Temadan alınan renk
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.teal),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

class UserMessage extends StatelessWidget {
  final String message;

  const UserMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(2),
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.teal,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
