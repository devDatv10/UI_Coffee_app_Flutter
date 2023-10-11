import 'package:flutter/material.dart';

class SizeProducts extends StatefulWidget {
  final String titleSize;
  const SizeProducts({super.key, required this.titleSize});

  @override
  State<SizeProducts> createState() => _SizeProductsState();
}

class _SizeProductsState extends State<SizeProducts> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          color: isPressed ? Colors.black : Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
          border: isPressed
              ? Border.all(
                  color: Colors.orange,
                  width: 1,
                )
              : null, 
        ),
        child: Center(
          child: Text(
            widget.titleSize,
            style: TextStyle(
              color: isPressed ? Colors.orange : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
