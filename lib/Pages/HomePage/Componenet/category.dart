import 'package:quote_app/headers.dart';

Widget Categories({required size, required context}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        ...allCategories
            .map(
              (e) => GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.only(
                    left: 5,
                    top: 2,
                    bottom: 5,
                  ),
                  height: size.height * 0.08,
                  width: size.width * 0.18,
                  decoration: BoxDecoration(
                    color: Colors
                        .primaries[allCategories.indexOf(e) % 18].shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(e),
                ),
              ),
            )
            .toList(),
      ],
    ),
  );
}
