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
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.quotePage: (context) => const QuotePage(),
      },
    );
  }
}
