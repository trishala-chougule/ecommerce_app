import 'package:flutter/material.dart';

class MenuDropdown extends StatelessWidget {
  final String title;
  final Widget page;

  const MenuDropdown({super.key, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(title, style: TextStyle(color: Colors.white)),
    );
  }
}