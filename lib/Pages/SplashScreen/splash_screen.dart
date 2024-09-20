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
      backgroundColor: Color(0xff000000),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.75,
          width: size.width * 0.75,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/quotify_logo.png'))),
        ),
      ),
    );
  }
}
