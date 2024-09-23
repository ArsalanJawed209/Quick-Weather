import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/splash_provider.dart';
import 'providers/weather_provider.dart';
import 'screens/weather_screen.dart';
import 'utils/colors.dart';
import 'services/navigation_service.dart';
import 'utils/routes.dart';
import 'utils/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: primary),
        title: "Quick Weather",
        debugShowCheckedModeBanner: false,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: onGenerateRoute,
        initialRoute: splashScreenRoute,
      ),
    );
  }
}
