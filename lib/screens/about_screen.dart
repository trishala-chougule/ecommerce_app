import 'package:ar_model_viewer/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_footer_widget.dart';
import '../widgets/global_drawer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey, // Associate the key with the Scaffold
      appBar: CustomAppBar.withDrawer(scaffoldKey: scaffoldKey), // Pass the key
      drawer: const GlobalDrawer(), // Use the global drawer widget
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(title: 'About Biz4 Shop'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our Story',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Biz4 Shop was founded in 2020 with a mission to bring quality products to customers worldwide. '
                        'We started as a small family business and have grown into a trusted e-commerce platform.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Our Team',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      _buildTeamCard('John Doe', 'CEO'),
                      _buildTeamCard('Jane Smith', 'COO'),
                      _buildTeamCard('Mike Johnson', 'CTO'),
                      _buildTeamCard('Sarah Brown', 'Marketing'),
                    ],
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

  Widget _buildTeamCard(String name, String position) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 40, backgroundColor: Colors.blue),
            const SizedBox(height: 10),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(position, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
