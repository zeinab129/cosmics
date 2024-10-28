import 'package:cosmics/core/provider/my_provider.dart';
import 'package:cosmics/view/screens/home_screen.dart';
import 'package:cosmics/view/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.forward();

    Future.delayed(
      const Duration(seconds: 5),
      () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => (Provider.of<MyProvider>(context)).firebaseUser != null? HomeScreen():SigninScreen()),
        );

      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: FadeTransition(
            opacity: animation as Animation<double>,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ic_bg1.png"),
                      fit: BoxFit.fill)),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/ic_logo.png"))),
              ),
            ),
          ));
  }
}
