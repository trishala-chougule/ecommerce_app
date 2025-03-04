import 'package:ar_model_viewer/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
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
      onGenerateRoute: (settings) {
        print("onGenerateRoute ...  ${settings.name}");
        if (settings.name == '/productdetails') {
          final arguments = settings.arguments as Map<String, String>;
          print("onGenerateRoute arguments ...  ${arguments}");
          final id = arguments['id']!;
          final category = arguments['category']!;

          print("onGenerateRoute arguments id : ${id} category : ${category}");
          return MaterialPageRoute(
            builder: (context) => ProductDetails(id: id, category: category),
          );
        } else if (settings.name!.contains("/productdetails")) {
          // Extract query parameters from the URL
          final uri = Uri.parse(settings.name!);
          print("uri ... ${uri}");
          final id = uri.queryParameters['id']; // Get 'id' parameter
          final category =
              uri.queryParameters['category']; // Get 'category' parameter
          print("id ... ${id}  ... category .... ${category}");
          // Check if parameters are present and pass them to the ProductDetailsScreen
          if (id != null && category != null) {
            return MaterialPageRoute(
              builder: (context) => ProductDetails(id: id, category: category),
            );
          }
        }
        return null;
      },

      routes: {
        '/': (context) => const HomeScreen(),
        '/categories': (context) => const CategoriesScreen(),
        '/contact': (context) => const ContactScreen(),
        '/about': (context) => const AboutScreen(),
        '/categorylist': (context) => const CategoryList(),
        // '/scanqr': (context) => const ScanQRScreen(),
        //  ProductDetails.routeName: (context) =>  ProductDetails(id: '', category: '',),
      },
    );
  }
}
