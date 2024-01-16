import 'dart:convert';

import 'package:weather_application/data/data_provider/weather_data_provider.dart';
import 'package:weather_application/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;
  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Dhaka';
      final weatherData =
          await weatherDataProvider.getCurrentWeather(cityName: cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
