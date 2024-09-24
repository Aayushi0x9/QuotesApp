import 'package:quote_app/headers.dart';

import 'Component/category.dart';
import 'Component/listview.dart';
import 'Component/quotesgridview.dart';

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
        title: const Text(
          'Quotes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black, // Transparent to allow the gradient
        elevation: 4, // Adds a subtle shadow effect
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff066782), // Dark Teal
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

      backgroundColor: Colors.black, // Make the background transparent
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SearchBox
            // Searchbox(),
            SizedBox(height: size.height * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height,
                  width: size.width * 0.88,
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
    );
  }
}
