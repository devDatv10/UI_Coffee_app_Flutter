import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final Function()? onTap;

  const ButtonLogin({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Center(
          child: Text('Login'),
        ),
      ),
    );
  }
}