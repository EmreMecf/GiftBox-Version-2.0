import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
    final theme = Theme.of(context); // Temayı al

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: theme.colorScheme.surface, // Temadan yüzey rengini al
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.home_promo_cart_heading,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme
                            .colorScheme.primary, // Temadan birincil rengi al
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.home_promo_cart_title,
                      style: TextStyle(
                          fontSize: 14,
                          color: theme.colorScheme
                              .onSurface), // Temadan yüzey üzerindeki rengi al
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        homeViewModel.goToChatBot();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme
                            .colorScheme.secondary, // Temadan ikincil rengi al
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.home_promo_cart_button,
                        style: TextStyle(
                            color: theme.colorScheme
                                .onSecondary), // Temadan ikincil üzerindeki rengi al
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Image.asset('lib/assets/Aiicon.png', width: 80, height: 80),
              // Gerçek resim yolu ile değiştirin
            ],
          ),
        ),
      ),
    );
  }
}
