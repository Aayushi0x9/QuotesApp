import 'package:quote_app/headers.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: const Text(
          "👀 Can Edit 👀",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 1,
        centerTitle: true,
      ),
    );
  }
}
