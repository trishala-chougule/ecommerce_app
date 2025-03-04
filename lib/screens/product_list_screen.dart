import 'package:ar_model_viewer/models/product.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_platform/universal_platform.dart';

import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final String categoryName;
  final List<Product> products;
  const ProductListScreen({
    super.key,
    required this.categoryName,
    required this.products,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (UniversalPlatform.isAndroid ||
        UniversalPlatform.isIOS ||
        UniversalPlatform.isApple) {
      _requestCameraPermission();
    }
  }

  Future<void> _requestCameraPermission() async {
    // Check the current status of the camera permission
    PermissionStatus status = await Permission.camera.status;

    if (status.isDenied) {
      // If permission is denied, request it
      PermissionStatus newStatus = await Permission.camera.request();
      if (newStatus.isGranted) {
        // Permission granted, proceed with camera usage
        print("Camera permission granted");
      } else if (newStatus.isPermanentlyDenied) {
        // If permission is permanently denied, open settings
        openAppSettings();
      } else {
        // If permission is denied but not permanently, notify the user
        print("Camera permission denied");
      }
    } else if (status.isGranted) {
      // If permission is already granted, you can use the camera
      print("Camera permission already granted");
    }
  }

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
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: widget.products[index]);
            },
          );
        },
      ),
    );
  }
}
