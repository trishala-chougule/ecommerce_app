import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          '© 2025 Biz4 Shop. All Rights Reserved.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}