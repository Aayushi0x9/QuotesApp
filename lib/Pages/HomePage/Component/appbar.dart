import 'package:quote_app/headers.dart';

AppBar appBar({
  required title,
  required bool isList,
  required void Function() toggleList,
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
        onPressed: toggleList,
        icon: Icon(isList ? Icons.grid_view : Icons.view_list),
      ),
      const SizedBox(width: 5),
    ],
  );
}
