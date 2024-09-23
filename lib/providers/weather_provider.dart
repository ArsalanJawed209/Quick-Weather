import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_weather/services/common_widgets_service.dart';

import '../models/weather_model.dart';
import '../services/http_service.dart';
import '../utils/colors.dart';
import '../utils/service_locator.dart';

class WeatherProvider with ChangeNotifier {
  HttpService? http = locator<HttpService>();
  final CommonWidgets commonWidgets = locator<CommonWidgets>();

  final TextEditingController cityController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime now = DateTime.now();
  String? _formattedDate = "";

  bool _isLoading = false;
  Weather? _weather;

  Weather? get weather => _weather;
  String get formattedDate => _formattedDate!;

  bool? get loader => _isLoading;
  Future<void> getWeather(String cityName) async {
    _formattedDate = "";
    _weather = null;
    _isLoading = true;

    _formattedDate = DateFormat('EEEE, MMMM d').format(now);

    Weather? fetchedWeather = await http!.fetchWeather(cityName);

    if (fetchedWeather != null) {
      _weather = fetchedWeather;
    } else {
      commonWidgets.showToast("City not found");
    }
    _isLoading = false;
    notifyListeners();
  }
}
