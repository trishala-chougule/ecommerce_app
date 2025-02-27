import 'package:ar_model_viewer/widgets/custom_footer_widget.dart';
import 'package:ar_model_viewer/widgets/hero_banner.dart';
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
      key: scaffoldKey,
      appBar: CustomAppBar.withDrawer(scaffoldKey: scaffoldKey),
      drawer: const GlobalDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isNarrow = constraints.maxWidth < 600;
          return SingleChildScrollView(
            child: Column(
              children: [
                // Hero Section with Gradient Background
                HeroBanner(isNarrow),
                // Features Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Why Choose Us',
                        style: TextStyle(
                          fontSize: isNarrow ? 24 : 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'We provide exceptional service with quality products',
                        style: TextStyle(
                          fontSize: isNarrow ? 14 : 16,
                          color: Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: isNarrow ? 1 : 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: isNarrow ? 1.5 : 1.2,
                        children: [
                          _buildFeatureCard(
                            icon: Icons.verified,
                            title: 'Quality Products',
                            description:
                                'We ensure all our products meet the highest standards',
                            color: Colors.blue.shade700,
                          ),
                          _buildFeatureCard(
                            icon: Icons.local_shipping,
                            title: 'Fast Delivery',
                            description:
                                'Get your orders delivered quickly and safely',
                            color: Colors.purple.shade700,
                          ),
                          _buildFeatureCard(
                            icon: Icons.support_agent,
                            title: '24/7 Support',
                            description:
                                'Our team is always ready to assist you',
                            color: Colors.teal.shade700,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Call to Action Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: isNarrow ? 40 : 60,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                  child: Column(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: isNarrow ? 40 : 60,
                        color: Colors.blue.shade800,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Ready to Start Shopping?',
                        style: TextStyle(
                          fontSize: isNarrow ? 22 : 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isNarrow ? 10 : 100,
                        ),
                        child: Text(
                          'Join thousands of satisfied customers who have transformed their shopping experience with us',
                          style: TextStyle(
                            fontSize: isNarrow ? 14 : 16,
                            color: Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/categorylist");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade800,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: isNarrow ? 15 : 25,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Start Shopping',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.blue.shade800,
                              side: BorderSide(color: Colors.blue.shade800),
                              padding: EdgeInsets.symmetric(
                                horizontal: isNarrow ? 15 : 25,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Learn More',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
