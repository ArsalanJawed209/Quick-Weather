import 'package:flutter/material.dart';
import 'package:quick_weather/screens/weather_screen.dart';

import '../screens/splash_screen.dart';

const splashScreenRoute = '/';
// const SplashScreenDisplayName = 'Splash';

const weatherScreenRoute = '/weather-screen';
// const weatherScreenDisplayName = 'Weather';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen());

    case weatherScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => WeatherScreen());

    default:
      return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen());
  }
}
