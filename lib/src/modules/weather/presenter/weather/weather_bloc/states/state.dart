import 'package:flutter/cupertino.dart';

import '../../../../domain/entities/weather_entity.dart';

@immutable
abstract class WeatherState {}

class WeatherSuccess implements WeatherState {
  final WeatherEntity list;
  WeatherSuccess(this.list);
  
}

class WeatherStart extends WeatherState {}

class WeatherLoad extends WeatherState {}

class WeatherError extends WeatherState {
  final Exception error;

  WeatherError(this.error);
}
