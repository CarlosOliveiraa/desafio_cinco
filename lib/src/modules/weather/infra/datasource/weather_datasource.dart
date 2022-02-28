import '../../domain/entities/weather_entity.dart';


abstract class WeatherDataSource {
  Future<WeatherEntity> getWeather(String? city);
}
