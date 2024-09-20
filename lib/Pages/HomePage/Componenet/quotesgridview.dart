import '../../../headers.dart';

Widget QuoteGridView({required size}) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemCount: allQuotes.length,
    itemBuilder: (context, index) => GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MyRoutes.quotePage,
            arguments: allQuotes[index]);
      },
      child: Container(
        width: size.width,
        height: size.height * 0.2,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        child: Text('${allQuotes[index].quote}'),
        decoration: BoxDecoration(
            color: Colors.primaries[index % 18].shade200,
            borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
