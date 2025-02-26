import 'package:flutter/material.dart';
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
                    // Burger icon for narrow screens
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        // Check if the current state is valid before opening the drawer
                        if (widget.scaffoldKey.currentState != null && 
                            widget.scaffoldKey.currentContext != null) {
                          // Check if the drawer is already open to prevent reopening
                          if (!(widget.scaffoldKey.currentState?.isDrawerOpen ?? false)) {
                            widget.scaffoldKey.currentState?.openDrawer();
                          }
                        }
                      },
                    ),
                  ]
                  : [
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
                      const PopupMenuItem(value: 'The Leafy Corner', child: Text('The Leafy Corner')),
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
}