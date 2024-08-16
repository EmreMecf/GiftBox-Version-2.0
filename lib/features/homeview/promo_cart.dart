import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.home_promo_cart_heading,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal)),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.home_promo_cart_title,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        homeViewModel.goToChatBot();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal),
                      child: Text(
                        AppLocalizations.of(context)!.home_promo_cart_button,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Image.asset('lib/assets/Aiicon.png', width: 80, height: 80),
              // Replace with the actual image path
            ],
          ),
        ),
      ),
    );
  }
}
