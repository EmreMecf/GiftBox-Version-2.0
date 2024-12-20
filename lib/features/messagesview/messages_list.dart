import 'package:flutter/material.dart';
import 'package:giftbox/core/utils/url_builder.dart';
import 'package:giftbox/services/models/products/products_model.dart';
import 'package:url_launcher/url_launcher.dart'; // URL'yi açmak için

class AiMessage extends StatelessWidget {
  final List<ProductsModel> products;

  const AiMessage({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Temayı al

    if (products.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("ChatGPT'den ürün önerisi bulunamadı.",
            style: TextStyle(fontSize: 16)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tek bir CircleAvatar
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: theme.colorScheme.primary,
            child: Image.asset('lib/assets/Aiicon.png'), // AI ikonu
          ),
        ),
        // Ürünleri listele
        ...products.map((product) {
          final googleUrl = UrlBuilder.buildGoogleShoppingUrl(product.keywords);

          return InkWell(
            onTap: () => _launchURL(googleUrl), // Tıklama ile URL açılır
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface, // Temadan yüzey rengini al
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: theme.shadowColor.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.description,
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  // URL'yi açmak için fonksiyon
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // URL'yi Uri formatına çevir

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          mode: LaunchMode.externalApplication); // Harici tarayıcıda aç
    } else {
      throw 'URL açılamıyor: $url';
    }
  }
}
