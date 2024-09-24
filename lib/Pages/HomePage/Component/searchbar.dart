import 'package:flutter/material.dart';
import 'package:quote_app/headers.dart';

Widget Searchbox() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.white, // Light background for better contrast
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          offset: Offset(0, 2), // Subtle shadow for depth
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Search quotes...',
        hintStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 15),
      ),
    ),
  );
}
