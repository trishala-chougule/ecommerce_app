import 'package:ar_model_viewer/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'screens/category_list.dart';
import 'screens/home_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(const Biz4ShopApp());
}

class Biz4ShopApp extends StatelessWidget {
  const Biz4ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biz4 Shop',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 221, 117, 117),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 221, 117, 117),
          secondary: Colors.amber, // You can customize this
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/categories': (context) => const CategoriesScreen(),
        '/contact': (context) => const ContactScreen(),
        '/about': (context) => const AboutScreen(),
        '/categorylist': (context) => const CategoryList(),
         ProductDetails.routeName: (context) =>  ProductDetails(),
      },
    );
  }
}
