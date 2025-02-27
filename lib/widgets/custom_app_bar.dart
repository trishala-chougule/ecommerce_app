import 'package:ar_model_viewer/util.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

// Import the global drawer

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.scaffoldKey, // Required parameter for the scaffold key
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  static CustomAppBar withDrawer({
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) {
    return CustomAppBar(scaffoldKey: scaffoldKey);
  }
}

class _CustomAppBarState extends State<CustomAppBar> {
  final int cartItemCount = 3; // Replace with your actual cart count logic

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isNarrow = constraints.maxWidth < 600;

        return AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                'assets/logo.jpg',
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.red);
                },
              ),
              const SizedBox(width: 10),
              const Text('Biz4 Shop'),
            ],
          ),
          actions:
              isNarrow
                  ? [
                    // Cart icon with badge for narrow screens
                    _buildCartButton(),
                    // Profile icon for narrow screens
                    _buildProfileButton(),
                    // Burger icon for narrow screens
                    // Burger icon for narrow screens
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        // Check if the current state is valid before opening the drawer
                        if (widget.scaffoldKey.currentState != null &&
                            widget.scaffoldKey.currentContext != null) {
                          // Check if the drawer is already open to prevent reopening
                          if (!(widget.scaffoldKey.currentState?.isDrawerOpen ??
                              false)) {
                            widget.scaffoldKey.currentState?.openDrawer();
                          }
                        }
                      },
                    ),
                  ]
                  : [
                    // Search bar for wide screens
                    _buildSearchBar(),
                    const SizedBox(width: 10),
                    // Full menu for wide screens
                    _buildMenuItem(context, 'Home', '/', [
                      const PopupMenuItem(
                        value: 'home1',
                        child: Text('Featured'),
                      ),
                      const PopupMenuItem(
                        value: 'home2',
                        child: Text('New Arrivals'),
                      ),
                    ]),
                    _buildMenuItem(context, 'Categories', '/categories', [
                      const PopupMenuItem(
                        value: 'Electronics',
                        child: Text('Electronics'),
                      ),
                      const PopupMenuItem(
                        value: 'Home Decor',
                        child: Text('Home Decor'),
                      ),
                      const PopupMenuItem(
                        value: 'The Leafy Corner',
                        child: Text('The Leafy Corner'),
                      ),
                      const PopupMenuItem(
                        value: 'The Gift Spot',
                        child: Text('The Gift Spot'),
                      ),
                    ]),
                    _buildMenuItem(context, 'Contact Us', '/contact', []),
                    _buildMenuItem(context, 'About Us', '/about', [
                      const PopupMenuItem(
                        value: 'about1',
                        child: Text('Our Story'),
                      ),
                      const PopupMenuItem(value: 'about2', child: Text('Team')),
                    ]),
                    // Wishlist button
                    _buildWishlistButton(),
                    // Cart button with badge
                    _buildCartButton(),
                    // Profile/Account menu
                    _buildProfileMenu(context),
                    const SizedBox(width: 8),
                  ],
        );
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    String route,
    List<PopupMenuEntry> menuItems,
  ) {
    return PopupMenuButton(
      splashRadius: 0,
      onSelected: (value) {
        if (title == 'Categories') {
          Navigator.pushNamed(context, route, arguments: value as String);
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      itemBuilder: (context) => menuItems,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(title),
      ),
    );
  }

  Widget _buildCartButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: 0, end: 0),
        badgeContent: Text(
          cartItemCount.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
        badgeStyle: badges.BadgeStyle(
          badgeColor: Colors.red.shade700,
          padding: const EdgeInsets.all(4),
        ),
        child: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            showToast("Comming Soon.....");
            //Navigator.pushNamed(context, '/cart');
          },
          tooltip: 'Cart',
        ),
      ),
    );
  }

  Widget _buildProfileButton() {
    return IconButton(
      icon: const Icon(Icons.person),
      onPressed: () {
        showToast("Comming Soon.....");
        //Navigator.pushNamed(context, '/profile');
      },
      tooltip: 'Profile',
    );
  }

  Widget _buildWishlistButton() {
    return IconButton(
      icon: const Icon(Icons.favorite_border),
      onPressed: () {
        Navigator.pushNamed(context, '/wishlist');
      },
      tooltip: 'Wishlist',
    );
  }

  Widget _buildProfileMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.person),
      tooltip: 'Account',
      onSelected: (value) {
        switch (value) {
          case 'profile':
            Navigator.pushNamed(context, '/profile');
            break;
          case 'orders':
            Navigator.pushNamed(context, '/orders');
            break;
          case 'wishlist':
            Navigator.pushNamed(context, '/wishlist');
            break;
          case 'address':
            Navigator.pushNamed(context, '/address');
            break;
          case 'settings':
            Navigator.pushNamed(context, '/settings');
            break;
          case 'logout':
            // Implement logout functionality
            break;
        }
      },
      itemBuilder:
          (context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'profile',
              child: Row(
                children: [
                  Icon(Icons.person, size: 18),
                  SizedBox(width: 8),
                  Text('My Profile'),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'orders',
              child: Row(
                children: [
                  Icon(Icons.shopping_bag, size: 18),
                  SizedBox(width: 8),
                  Text('My Orders'),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'wishlist',
              child: Row(
                children: [
                  Icon(Icons.favorite, size: 18),
                  SizedBox(width: 8),
                  Text('Wishlist'),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'address',
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 18),
                  SizedBox(width: 8),
                  Text('My Addresses'),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'settings',
              child: Row(
                children: [
                  Icon(Icons.settings, size: 18),
                  SizedBox(width: 8),
                  Text('Settings'),
                ],
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem<String>(
              value: 'logout',
              child: Row(
                children: [
                  Icon(Icons.logout, size: 18),
                  SizedBox(width: 8),
                  Text('Logout'),
                ],
              ),
            ),
          ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 200,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: Icon(Icons.search, size: 20),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8),
        ),
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
