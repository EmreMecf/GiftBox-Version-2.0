import 'package:flutter/material.dart';

class PromoCardWidget extends StatelessWidget {
  const PromoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const Text('Mind Box ile Hediye Bul',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal)),
                    const SizedBox(height: 8),
                    const Text(
                      'Hediye seçimi konusunda kararsız mı kaldın? MindBox, sevdiklerinin ilgi alanlarına, hobilerine ve kişiligine en uygun hediyeleri saniyeler içinde bulmanı saglar.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal),
                      child: const Text('Hediye Bul'),
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
