import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Size size;
  final Widget child;
  const CustomContainer({super.key, required this.child, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0,
                  4), // Offset changes the position of the shadow
            )
          ],
          border: Border.all(
            color: Colors.grey.shade300, // Border color
            width: 2, // Border width
          ),
          borderRadius: BorderRadius.circular(2)),
      height: size.height / 2.2,
      width: size.width / 1.25,
      child: child,
    );
  }
}
