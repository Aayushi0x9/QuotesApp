import 'package:flutter/material.dart';
import 'package:quote_app/Pages/HomePage/Componenet/quotesgridview.dart';
import 'package:quote_app/headers.dart';
import 'Componenet/listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isList = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quotes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor:
            Colors.transparent, // Transparent to allow the gradient
        elevation: 4, // Adds a subtle shadow effect
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff066782), // Dark Teal
                Color(0xff39d5ff), // Lighter Blue
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(_isList ? Icons.grid_view : Icons.list,
                color: Colors.white),
            onPressed: () {
              setState(() {
                _isList = !_isList;
              });
            },
          ),
        ],
      ),

      backgroundColor: Colors.transparent, // Make the background transparent
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff066782), // Dark Teal
              Color(0xff39d5ff).withOpacity(0.5), // Lighter Blue
              Color(0xffe0ffff).withOpacity(0.2), // Light Cyan
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SearchBox
              Searchbox(),
              SizedBox(height: size.height * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height,
                    width: size.width * 0.8,
                    child: _isList
                        ? // ListView
                        quoteListView(context: context, size: size)
                        : // GridView
                        QuoteGridView(size: size),
                  ),
                  // Categories
                  Expanded(child: Categories(size: size, context: context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
