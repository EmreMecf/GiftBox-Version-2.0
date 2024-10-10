import 'package:flutter/material.dart';
import 'package:giftbox/features/homeview/index.dart';
import 'package:giftbox/features/index.dart';
import 'package:provider/provider.dart';

import '../viewmodel/profile_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileViewModel = context.read<ProfileViewModel>();
      profileViewModel.loadUserData();
    });
  }

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          PromoCard(),
          Expanded(
            child: Consumer<ProfileViewModel>(
              builder: (context, profileViewModel, child) {
                final userId = profileViewModel.userId;

                // Eğer kullanıcı kimliği yüklendiyse HistoryCard'a gönderiyoruz
                if (userId!.isNotEmpty) {
                  return HistoryCard(userId: userId);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  ); // Yükleme durumu için.
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onNavBarTap: _onNavBarTap,
      ),
    );
  }
}
