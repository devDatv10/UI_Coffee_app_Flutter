import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCart extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const ButtonCart({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Colors.orange
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 25)),
            const SizedBox(width: 10.0,),
            const Icon(Icons.shopping_cart, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}