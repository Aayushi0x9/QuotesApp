import 'package:flutter/material.dart';
import 'package:quote_app/headers.dart';

Widget quoteListView({required BuildContext context, required Size size}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        ...List.generate(
          allQuotes.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.quotePage,
                  arguments: allQuotes[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff066782), // Dark Teal
                    Color(0xff39d5ff)
                        .withOpacity(0.3), // Light Blue with opacity
                  ],
                ),
              ),
              width: size.width,
              margin: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                allQuotes[index].quote,
                style: TextStyle(
                  color: Colors.white, // Text color for contrast
                  fontSize: 16, // Optional: Adjust text size
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
