import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/global_drawer.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  final List<String> categories = const [
    'Electronics',
    'Home Decor',
    'The Leafy Corner',
    'The Gift Spot',
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar.withDrawer(scaffoldKey: scaffoldKey),
      drawer: const GlobalDrawer(),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount =
                constraints.maxWidth > 1200
                    ? 4
                    : constraints.maxWidth > 800
                        ? 3
                        : constraints.maxWidth > 600
                            ? 2
                            : 1;
            return Column(
              children: [
                const SizedBox(height: 50),
                GridView.builder(
                  // Removed shrinkWrap and NeverScrollableScrollPhysics
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: categories.length,
                  physics: const BouncingScrollPhysics(), // Enables scrolling
                  shrinkWrap: true, // Allows GridView to size based on content
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/categories',
                            arguments: categories[index],
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).primaryColor.withOpacity(0.7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
