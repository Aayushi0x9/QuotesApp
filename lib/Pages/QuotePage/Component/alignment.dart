import 'package:flutter/material.dart';
import 'package:quote_app/Pages/QuotePage/Component/heading.dart';

Widget alignmentFont(
    {required dynamic textAlign,
    required String title,
    required size,
    required getsetState}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(height: size.height * 0.05),
      heading(heading: title),
      SizedBox(height: size.height * 0.05),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(
              Icons.format_align_left,
              color: Colors.white,
            ),
            onPressed: () {
              textAlign = TextAlign.left;
              getsetState();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.format_align_center,
              color: Colors.white,
            ),
            onPressed: () {
              textAlign = TextAlign.center;
              getsetState();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.format_align_right,
              color: Colors.white,
            ),
            onPressed: () {
              textAlign = TextAlign.right;
              getsetState();
            },
          ),
        ],
      ),
    ],
  );
}
