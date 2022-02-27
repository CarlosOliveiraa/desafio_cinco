import '../models/weather_search_model.dart';

abstract class WeatherDataSource {
  Future<List<WeatherSearchModel>>? getWeather(String? city);
}
