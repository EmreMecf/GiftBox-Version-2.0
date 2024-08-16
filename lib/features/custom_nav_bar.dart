import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onNavBarTap;

  const CustomNavBar(
      {super.key, required this.currentIndex, required this.onNavBarTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onNavBarTap,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppLocalizations.of(context)?.nav_bar_home_label,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_month),
                label: AppLocalizations.of(context)?.nav_bar_calender_label,
              ),
            ],
          ),
        ),
        Positioned(
          top: -30,
          left: MediaQuery.of(context).size.width / 2 - 30,
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
