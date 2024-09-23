import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
import '../utils/constants.dart';

class HttpService {
  Future<Weather?> fetchWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$OPENWEATHER_API_KEY');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Weather.fromJson(data);
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
