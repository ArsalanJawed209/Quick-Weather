import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_weather/providers/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SplashProvider>().loadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/splash.png',
          height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.18),
              child: const Text(
                "Quick Weather",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
