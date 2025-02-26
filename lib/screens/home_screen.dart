import 'package:ar_model_viewer/widgets/custom_footer_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/global_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey, // Associate the key with the Scaffold
      appBar: CustomAppBar.withDrawer(scaffoldKey: scaffoldKey), // Pass the key
      drawer: const GlobalDrawer(), // Use the global drawer widget
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isNarrow = constraints.maxWidth < 600;

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: isNarrow ? 150 : 300,
                  color: Colors.red[200],
                  child: Center(
                    child: Text(
                      'Welcome to Biz4 Shop',
                      style: TextStyle(
                        fontSize: isNarrow ? 20 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isNarrow ? 2 : 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: isNarrow ? 0.8 : 1.0,
                    children: List.generate(6, (index) {
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Product ${index + 1}',
                              style: TextStyle(fontSize: isNarrow ? 14 : 16),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const CustomFooterWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
