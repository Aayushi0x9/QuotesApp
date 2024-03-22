import 'package:quote_app/headers.dart';

AppBar appBar({
  required tittle,
  required bool isList,
}) {
  return AppBar(
    centerTitle: true,
    titleSpacing: 1,
    title: const Text('Quote Creater'),
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.my_library_books),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.save_alt),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(isList ? Icons.grid_view : Icons.view_list),
      ),
      SizedBox(width: 5),
    ],
  );
}
