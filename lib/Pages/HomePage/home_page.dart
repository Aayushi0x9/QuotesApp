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
      appBar: appBar(
          title: 'Quotes',
          isList: _isList,
          toggleList: () {
            _isList = !_isList;
            setState(() {});
          }),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //SearchBax
                Searchbox(),
                SizedBox(height: size.height * 0.01),

                Row(
                  children: [
                    Container(
                      height: size.height,
                      width: size.width * 0.77,
                      child: _isList
                          ?
                          //listview
                          quoteListView(context: context, size: size)
                          //gridview
                          : QuoteGridView(size: size),
                    ),
                    //Categories
                    Categories(size: size, context: context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
