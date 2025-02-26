import 'package:ar_model_viewer/models/product.dart';
import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryName;
  final List<Product> products;
  const ProductListScreen({
    super.key,
    required this.categoryName,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount =
              constraints.maxWidth > 1200
                  ? 4 // Reduced to 4 columns on ultra-wide screens for larger cards
                  : constraints.maxWidth > 800
                  ? 3 // Reduced to 3 columns for larger cards
                  : constraints.maxWidth > 600
                  ? 2 // 2 columns for tablets
                  : 1; // 1 column for narrow screens (mobile-like on web)
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical, // Vertical scrolling
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.8, // Adjusted to make cards taller and wider
              crossAxisSpacing: 20, // Increased spacing for larger cards
              mainAxisSpacing: 20, // Increased spacing for larger cards
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          );
        },
      ),
    );
  }
}
