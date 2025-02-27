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
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount =
              constraints.maxWidth > 1200
                  ? 4 // Reduced to 4 columns on ultra-wide screens for larger cards
                  : constraints.maxWidth > 800
                  ? 3 // Reduced to 3 columns for larger cards
                  : constraints.maxWidth > 600
                  ? 2 // 2 columns for tablets
                  : 1; // 1 column for narrow screens (mobile-like on web)
          return Column(
            children: [
              SizedBox(height: 50),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical, // Vertical scrolling
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio:
                        0.8, // Adjusted to make cards taller and wider
                    crossAxisSpacing: 20, // Increased spacing for larger cards
                    mainAxisSpacing: 20, // Increased spacing for larger cards
                  ),
                  itemCount: categories.length,
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
                          width: 200,
                          height: 200,
                          child: Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
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
              ),
            ],
          );
        },
      ),
    );
  }
}
