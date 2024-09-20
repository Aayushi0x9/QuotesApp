import 'Pages/HomePage/home_page.dart';
import 'Pages/QuotePage/quote_page.dart';
import 'Pages/SplashScreen/splash_screen.dart';
import 'headers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff066782), // Dark Teal
        hintColor: Color(0xff39d5ff), // Light Blue
        scaffoldBackgroundColor: Colors.black, // Background color of the app
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(color: Colors.white), // Default text color
        //   bodyText2: TextStyle(color: Colors.white),
        //   headline6: TextStyle(color: Colors.white), // AppBar title color
        // ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff066782), // AppBar color
          iconTheme: IconThemeData(color: Colors.white), // AppBar icon color
        ),
      ),
      initialRoute: MyRoutes.splashScreen,
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.quotePage: (context) => const QuotePage(),
      },
    );
  }
}
