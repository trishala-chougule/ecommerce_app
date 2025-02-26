import 'package:ar_model_viewer/screens/product_list_screen.dart';
import 'package:ar_model_viewer/widgets/custom_footer_widget.dart';
import 'package:ar_model_viewer/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/global_drawer.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // Create a scaffold key that persists for the lifetime of this state
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Retrieve the selected category from route arguments
    final String? selectedCategory =
        ModalRoute.of(context)?.settings.arguments as String?;

    final List<Product> products = getProductList(
      selectedCategory ?? "Product",
    );

    return Scaffold(
      key: _scaffoldKey, // Use the state's persistent key
      appBar: CustomAppBar.withDrawer(scaffoldKey: _scaffoldKey),
      drawer: const GlobalDrawer(), // Use the global drawer widget
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              title:
                  selectedCategory != null
                      ? 'Category: $selectedCategory'
                      : 'Shop by Categories',
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore Our Categories',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ProductListScreen(
                    categoryName: selectedCategory ?? "Product",
                    products: products,
                  ),
                ],
              ),
            ),
            const CustomFooterWidget(),
          ],
        ),
      ),
    );
  }
}