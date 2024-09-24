import 'package:flutter/material.dart';
import 'package:quote_app/utils/Globals/globals.dart';

Widget bgColor({
  required dynamic selectedImage,
  required dynamic bgColor,
  required getsetstate,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: Globals.colors.map((color) {
        return GestureDetector(
          onTap: () {
            selectedImage = null;
            bgColor = color; // Update background color
            getsetstate();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: bgColor == color ? 3 : 1,
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
