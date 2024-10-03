import 'package:flutter/material.dart';
import 'package:giftbox/services/models/products/products_model.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/index.dart';

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
          return Container(
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
                  product.description ?? "Açıklama yok.",
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}

class UserMessage extends StatelessWidget {
  final String message;

  const UserMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.watch<ProfileViewModel>();

    final theme = Theme.of(context); // Temayı al

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end, // Avatar sağda olacak
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface, // Temadan yüzey rengini al
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: theme.shadowColor.withOpacity(0.2),
                    // Temadan gölge rengini al
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message,
                style:
                    TextStyle(color: theme.colorScheme.onSurface, fontSize: 16),
                // Temadan yüzey üzerindeki rengi al
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // Kullanıcı Avatar sağda
          Container(
            margin: const EdgeInsets.only(left: 10),
            // Mesaj kutusundan biraz boşluk bırakıyoruz
            child: CircleAvatar(
              radius: 20,
              backgroundColor: theme.colorScheme.primary,
              backgroundImage: profileViewModel.userPhoto != null
                  ? NetworkImage(profileViewModel.userPhoto!)
                  : const AssetImage('lib/assets/user.png') as ImageProvider,
            ),
          ),
        ],
      ),
    );
  }
}
