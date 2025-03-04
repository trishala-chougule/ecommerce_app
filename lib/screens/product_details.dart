import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../models/product.dart';
import '../widgets/ar_viewer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/global_drawer.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/productdetails';
  final String id;
  final String category;

  // Constructor to accept the arguments
  // Constructor to receive the data (id and category)
  ProductDetails({super.key, required this.id, required this.category});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _isQrVisible = false;

  @override
  Widget build(BuildContext context) {
    // Retrieve the selected category from route arguments
    //final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final productId = arguments['id'];
    // final category = arguments['category'];

    final Product product = getProductList(
      widget.category,
    ).firstWhere((product) => product.id == widget.id);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar.withDrawer(scaffoldKey: scaffoldKey),
      drawer: const GlobalDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isNarrow = constraints.maxWidth < 600;

          return isNarrow ? mobileView(product) : webView(product);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Custom back navigation to pop the current screen from the stack
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        tooltip: 'Go Back',
      ),
    );
  }

  Widget _buildProductImageCard(Product product) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: const Color(0xFFE38E8E), // Pinkish color from the UI
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Center(
                    child: ARViewerScreen(
                      modelPath: product.imageUrl,
                      placement: product.placement,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow(Product product) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 18),
        const SizedBox(width: 4),
        Text(
          '${product.rating} ★ ~ ${product.reviews}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 4),
        const Icon(Icons.star, color: Colors.black, size: 18),
        const SizedBox(width: 4),
        const Text(
          '~ 672',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildPriceRow(Product product) {
    return Row(
      children: [
        Text(
          '₹${product.price} M.R.P.: ₹${product.originalPrice} (${product.discount})',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildProductDetails(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          product.name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Modern white chair with a simple design. Suitable for dining rooms, offices, or as additional seating in any room.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        _buildRatingRow(product),
        const SizedBox(height: 8),
        _buildPriceRow(product),
        const Text(
          'M.R.P.: ₹1499 (41% off)',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              'FREE delivery ${product.deliveryDate}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {},
            child: const Text('Buy Now'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {},
            child: const Text(
              'Add to Cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileView(Product product) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildProductImageCard(product),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: _buildProductDetails(product),
          ),
          SizedBox(height: 5),
         // _buildViewQRCode(product.id, product.category),
        ],
      ),
    );
  }

  Widget webView(Product product) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Expanded(flex: 1, child: _buildProductImageCard(product)),
            const SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _buildProductDetails(product),
                    const SizedBox(height: 10),
                    _buildViewQRCode(product.id, product.category),
                    const SizedBox(height: 20),
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildViewQRCode(String id, String category) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isQrVisible = !_isQrVisible;
              });
            },
            child: SizedBox(
              width: 200,
              child: Row(
                children: [
                  Icon(Icons.qr_code),
                  SizedBox(width: 10),
                  Text(_isQrVisible ? "Hide QR Code" : "Try in Your Home"),
                ],
              ),
            ),
          ),
          SizedBox(height: 2),
          if (_isQrVisible)
            QrImageView(
              data:
                  'https://ecommerce-app-dtz.pages.dev/#/productdetails?id=$id&category=$category',
              version: QrVersions.auto,
              size: 200.0,
            ),
        ],
      ),
    );
  }
}
