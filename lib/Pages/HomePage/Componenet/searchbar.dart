import 'package:quote_app/headers.dart';

Widget Searchbox() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Search',
      fillColor: Colors.blue,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    ),
  );
}
