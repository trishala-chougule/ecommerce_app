import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  String title;
  bool isNarrow;
  HeaderWidget({super.key, required this.title, required this.isNarrow});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isNarrow ? 250 : 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade800, Colors.purple.shade700],
        ),
      ),
      child: Stack(
        children: [
          // Background Decoration
          Positioned(
            right: -50,
            top: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: -30,
            bottom: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isNarrow ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );

    /* Container(
      height: 300,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    ); */
  }
}
