import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_weather/utils/routes.dart';

import '../services/navigation_service.dart';
import '../utils/service_locator.dart';

class SplashProvider with ChangeNotifier {
  var navigationService = locator<NavigationService>();
  loadPage() {
    Timer(const Duration(seconds: 3), () async {
      navigationService.navigateToPop(weatherScreenRoute);
    });
  }
}
