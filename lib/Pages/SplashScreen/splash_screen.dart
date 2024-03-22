import 'package:quote_app/headers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.pushReplacementNamed(context, MyRoutes.homePage);
        tick.cancel();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.5,
          width: size.width * 0.5,
          child: Image.network(
              'https://play-lh.googleusercontent.com/HREvqhtt08PQ1nKcVrhrPpTAJzEq39Mw4ed-LK9Fpj7c-OlTssO0uZeTfaZzCjAZow'),
        ),
      ),
    );
  }
}
