import 'package:flutter/material.dart';

class GlobalDrawer extends StatefulWidget {
  const GlobalDrawer({super.key});

  @override
  State<GlobalDrawer> createState() => _GlobalDrawerState();
}

class _GlobalDrawerState extends State<GlobalDrawer> {
  // Track which ExpansionTile is expanded
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Biz4 Shop',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          _buildDrawerItem(context, 'Home', '/', [
            'Featured',
            'New Arrivals',
          ], 0),
          _buildDrawerItem(context, 'Categories', '/categories', [
            'Electronics',
            'Home Decor',
            'The Leafy Corner',
            'The Gift Spot',
          ], 1),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.pushNamed(context, '/contact');
            },
          ),
          _buildDrawerItem(context, 'About Us', '/about', [
            'Our Story',
            'Team',
          ], 2),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    String route,
    List<String> submenuItems,
    int index,
  ) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight:
              _expandedIndex == index ? FontWeight.bold : FontWeight.normal,
          color: _expandedIndex == index ? Colors.blue : Colors.black87,
        ),
      ),
      backgroundColor:
          _expandedIndex == index
              ? Colors.grey[100] // Light gray background when expanded
              : null,
      onExpansionChanged: (isExpanded) {
        setState(() {
          _expandedIndex = isExpanded ? index : null;
        });
      },
      children:
          submenuItems.map((submenuItem) {
            return ListTile(
              title: Text(
                submenuItem,
                style: TextStyle(
                  color: _expandedIndex == index ? Colors.blue : Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close drawer
                if (title == 'Categories') {
                  Navigator.pushNamed(context, route, arguments: submenuItem);
                } else {
                  Navigator.pushNamed(context, route);
                }
              },
              selected: _expandedIndex == index, // Highlight selected submenus
              selectedTileColor:
                  Colors.grey[200], // Light gray for selected submenus
            );
          }).toList(),
    );
  }
}
