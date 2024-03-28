import 'package:quote_app/headers.dart';

Widget quoteListView({required context, required size}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        ...List.generate(
          allQuotesData.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.quotePage);
            },
            child: Card(
              color: Colors.primaries[index % 18].shade200,
              child: Container(
                width: size.width,
                margin: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
                padding: const EdgeInsets.all(10),
                child: Text(allQuotes[index].quote),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
