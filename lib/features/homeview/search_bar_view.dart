import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class SearchBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Ara...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (query) {
          Provider.of<HistoryViewModel>(context, listen: false)
              .updateSearchQuery(query);
        },
      ),
    );
  }
}
