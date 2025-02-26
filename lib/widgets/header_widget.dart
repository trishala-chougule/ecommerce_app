import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  String title;
  HeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
