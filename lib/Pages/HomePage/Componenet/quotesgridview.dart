import 'package:flutter/material.dart';
import '../../../headers.dart';

Widget QuoteGridView({required Size size}) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemCount: allQuotes.length,
    itemBuilder: (context, index) => GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MyRoutes.quotePage,
            arguments: allQuotes[index]);
      },
      child: Container(
        width: size.width,
        height: size.height * 0.2,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xff066782), // Dark Teal
              Color(0xff39d5ff).withOpacity(0.3), // Light Blue with opacity
            ],
          ),
        ),
        child: Center(
          child: Text(
            '${allQuotes[index].quote}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white, // Text color for contrast
              fontSize: 16, // Optional: Adjust text size
            ),
          ),
        ),
      ),
    ),
  );
}
