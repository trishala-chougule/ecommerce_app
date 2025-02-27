import 'package:flutter/material.dart';

class GlobalDrawer extends StatefulWidget {
  const GlobalDrawer({super.key});

  @override
  State<GlobalDrawer> createState() => _GlobalDrawerState();
}

class _GlobalDrawerState extends State<GlobalDrawer> {
  // Track which ExpansionTile is expanded
  int? _expandedIndex;

  // For demonstration purposes only - replace with actual implementation
  final int cartItemCount = 3;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer header with user profile info
          _buildDrawerHeader(context),

          // Main navigation
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

          // Shopping features
          _buildShoppingSection(context),

          // Original menu items
          ListTile(
            leading: const Icon(Icons.contact_support),
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

          const Divider(),

          // Settings and help
          _buildSupportSection(context),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.7),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white70,
                child: Icon(Icons.person, size: 40, color: Colors.blueGrey),
              ),
              Icon(Icons.settings, color: Colors.white70),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Welcome,',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Guest User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShoppingSection(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Cart'),
          trailing: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.red.shade700,
              shape: BoxShape.circle,
            ),
            child: Text(
              cartItemCount.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/cart');
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Wishlist'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/wishlist');
          },
        ),
        ListTile(
          leading: const Icon(Icons.local_shipping),
          title: const Text('Track Order'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/track-order');
          },
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('Help & Support'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/help');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/settings');
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            Navigator.pop(context);
            // Add your logout logic here
          },
        ),
      ],
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    String route,
    List<String> submenuItems,
    int index,
  ) {
    IconData leadingIcon;

    // Assign appropriate icons based on title
    switch (title) {
      case 'Home':
        leadingIcon = Icons.home;
        break;
      case 'Categories':
        leadingIcon = Icons.category;
        break;
      case 'About Us':
        leadingIcon = Icons.info;
        break;
      default:
        leadingIcon = Icons.arrow_right;
    }

    return ExpansionTile(
      leading: Icon(
        leadingIcon,
        color:
            _expandedIndex == index
                ? Theme.of(context).primaryColor
                : Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight:
              _expandedIndex == index ? FontWeight.bold : FontWeight.normal,
          color:
              _expandedIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.black87,
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
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 36,
                vertical: 10,
              ),
              title: Text(
                submenuItem,
                style: TextStyle(
                  color:
                      _expandedIndex == index
                          ? Theme.of(context).primaryColor
                          : Colors.black87,
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
