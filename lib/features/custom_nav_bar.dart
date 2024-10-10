import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onNavBarTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onNavBarTap,
  });

  @override
  Widget build(BuildContext context) {
    final navBarRoute = context.read<NavBarRoute>();
    final theme = Theme.of(context); // Temayı al

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Container(
            color: theme.colorScheme.surface, // Temadan yüzey rengini al
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                onNavBarTap(index);
                if (index == 0) {
                  navBarRoute.goToHome();
                } else if (index == 1) {
                  navBarRoute.goToCalendar();
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: currentIndex == 0
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface,
                  ),
                  label: AppLocalizations.of(context)?.nav_bar_home_label,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_month,
                    color: currentIndex == 1
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface,
                  ),
                  label: AppLocalizations.of(context)?.nav_bar_calender_label,
                ),
              ],
              selectedItemColor: theme.colorScheme.primary,
              // Seçilen öğe rengi
              unselectedItemColor: theme.colorScheme.onSurface,
              // Seçilmeyen öğe rengi
              backgroundColor: theme.colorScheme.surface, // Arka plan rengi
            ),
          ),
        ),
        Positioned(
          top: -30,
          left: MediaQuery.of(context).size.width / 2 - 30,
          child: FloatingActionButton(
            onPressed: () {
              navBarRoute.goToCategory();
            },
            backgroundColor: theme.colorScheme.secondary,
            // Temadan ikincil rengi al
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
