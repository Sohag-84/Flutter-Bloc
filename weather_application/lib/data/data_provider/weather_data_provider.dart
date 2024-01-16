import 'package:http/http.dart' as http;
import 'package:weather_application/secrets.dart';

class WeatherDataProvider {
  Future<String> getCurrentWeather({required String cityName}) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
