import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../services/common_widgets_service.dart';
import '../services/http_service.dart';
import '../services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  try {
    locator.registerSingleton(HttpService());
    locator.registerSingleton(NavigationService());
    locator.registerSingleton(CommonWidgets());
  } catch (err) {
    debugPrint(err.toString());
  }
}
