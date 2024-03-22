import 'package:quote_app/Pages/HomePage/Componenet/appbar.dart';
import 'package:quote_app/Pages/HomePage/Componenet/category.dart';
import 'package:quote_app/Pages/HomePage/Componenet/searchbar.dart';
import 'package:quote_app/headers.dart';

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
      appBar: appBar(tittle: 'Quotes', isList: _isList),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //SearchBax
              Searchbox(),
              SizedBox(
                height: size.height * 0.01,
              ),
              //Categories
              Categories(
                size: size,
              ),
              //Listview
              // quoteListView(context: context, size: size),
            ],
          ),
        ),
      ),
    );
  }
}
