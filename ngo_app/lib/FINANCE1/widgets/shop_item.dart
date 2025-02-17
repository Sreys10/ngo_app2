import 'package:flutter/material.dart';

class ShopItem extends StatelessWidget {
  final String shopName;
  final String imageAsset;
  final VoidCallback onTap;

  const ShopItem({
    super.key,
    required this.shopName,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image Section
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
            // Text Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                shopName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
