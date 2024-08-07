import 'package:flutter/material.dart';
import 'package:giftbox/features/index.dart';
import 'package:giftbox/features/homewidgets/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PromoCardWidget(),
            SearchBarWidget(),
            HistoryCartWidget(),
          ],
        ),
      ),
    );
  }
}
