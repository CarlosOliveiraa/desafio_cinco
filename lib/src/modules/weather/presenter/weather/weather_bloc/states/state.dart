import '../../../../infra/models/weather_search_model.dart';

abstract class WeatherState {}

class WeatherSuccess implements WeatherState {
  final List<WeatherSearchModel> list;
  WeatherSuccess(this.list);
}

class WeatherStart extends WeatherState {}

class WeatherLoad extends WeatherState {}

class WeatherError extends WeatherState {}
