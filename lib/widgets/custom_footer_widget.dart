import 'package:flutter/material.dart';

class CustomFooterWidget extends StatelessWidget {
  const CustomFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey[900],
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isNarrow = constraints.maxWidth < 600;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isNarrow
                  ? _buildVerticalLayout(context)
                  : _buildHorizontalLayout(context, constraints.maxWidth),
              const SizedBox(height: 20),
              Text(
                '© 2025 Biz4 Shop. All rights reserved.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isNarrow ? 12 : 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }

  // Horizontal layout for wide screens
  Widget _buildHorizontalLayout(BuildContext context, double maxWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildColumn(
          context,
          title: 'Biz4 Shop',
          items: ['About Us', 'Contact Us', 'Privacy Policy'],
          routes: ['/about', '/contact', null], // null for no route yet
          maxWidth: maxWidth / 2 - 40,
        ),
        _buildColumn(
          context,
          title: 'Customer Service',
          items: ['FAQ', 'Shipping', 'Returns'],
          routes: [null, null, null], // Placeholder routes
          maxWidth: maxWidth / 2 - 40,
        ),
      ],
    );
  }

  // Vertical layout for narrow screens
  Widget _buildVerticalLayout(BuildContext context) {
    return Column(
      children: [
        _buildColumn(
          context,
          title: 'Biz4 Shop',
          items: ['About Us', 'Contact Us', 'Privacy Policy'],
          routes: ['/about', '/contact', null],
        ),
        const SizedBox(height: 20),
        _buildColumn(
          context,
          title: 'Customer Service',
          items: ['FAQ', 'Shipping', 'Returns'],
          routes: [null, null, null],
        ),
      ],
    );
  }

  // Reusable column builder with tappable items
  Widget _buildColumn(
    BuildContext context, {
    required String title,
    required List<String> items,
    required List<String?> routes, // Corresponding routes for each item
    double? maxWidth,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
      child: Column(
        crossAxisAlignment:
            maxWidth != null
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...items.asMap().entries.map((entry) {
            int index = entry.key;
            String item = entry.value;
            String? route = routes[index];

            return GestureDetector(
              onTap: () {
                if (route != null) {
                  Navigator.pushNamed(context, route);
                } else {
                  // Placeholder action for items without routes
                  print('Tapped on $item - No route defined yet');
                  // You could show a SnackBar or dialog here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$item page coming soon!')),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  item,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
