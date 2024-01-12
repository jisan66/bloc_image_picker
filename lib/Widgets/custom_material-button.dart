import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double height;

  const CustomMaterialButton({super.key,
    required this.onPressed,
    required this.buttonText,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color(0xffff9501), // Background color
      textColor: Colors.white, // Text color
      elevation: 6, // Elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Border radius
        side: const BorderSide(color: Color(0xffff9501)), // Border color
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Button padding
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}