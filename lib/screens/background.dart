import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.png'), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
