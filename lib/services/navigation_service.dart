import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateToPop(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  closeScreen() {
    return navigatorKey.currentState!.pop();
  }
}
