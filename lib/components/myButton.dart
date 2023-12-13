import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class myButton extends StatelessWidget {

  final Function()? onTap;
  
  final String text;

  const myButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Color(0xFF4D5903),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
                text,
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
          ),
        ),
      ),
    );
  }
}
