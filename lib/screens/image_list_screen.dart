import 'package:ar_model_viewer/widgets/ar_viewer.dart';
import 'package:flutter/material.dart';

class ImageListScreen extends StatelessWidget {
  const ImageListScreen({super.key});

  final List<String> images = const [
    'assets/product.glb', // Add your asset images here
    'https://ar-demo-nine.vercel.app/assets/nike.glb', // Example URL image
    'https://modelviewer.dev/shared-assets/models/NeilArmstrong.glb',
    'assets/chimney.glb',
    'assets/chair.glb',
    'assets/lamp.glb',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image List')),
      body: GridView.builder(
        scrollDirection: Axis.vertical, // Vertical scrolling
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 10, // Horizontal spacing between items
          mainAxisSpacing: 10, // Vertical spacing between items
          childAspectRatio: 1, // Ensures a square 1:1 ratio (200x200)
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ARViewerScreen(modelPath: images[index], placement: "wall"),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: SizedBox(
                width: 200, // Fixed width
                height: 200, // Fixed height
                child: ARViewerScreen(modelPath: images[index], placement: "wall",),
              ),
            ),
          );
        },
      ),
    );
  }
}
