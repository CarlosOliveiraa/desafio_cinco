import 'dart:convert';

import 'package:desafio_cinco/src/modules/weather/domain/entities/weather_model.dart';

class WeatherSearchModel extends WeatherModel {
  WeatherSearchModel(
      {required temperature,
      required wind,
      required description,
      required forecast,
      required day})
      : super(
            temperature: temperature,
            wind: wind,
            description: description,
            forecast: forecast,
            day: day);

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'wind': wind,
      'description': description,
      'forecast': forecast,
      'day': day,
    };
  }

  factory WeatherSearchModel.fromMap(Map<String, dynamic> map) {
    return WeatherSearchModel(
      temperature: map['temperature'] ?? '',
      wind: map['wind'] ?? '',
      description: map['description'] ?? '',
      forecast: List<String>.from(map['forecast']),
      day: map['day'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherSearchModel.fromJson(String source) =>
      WeatherSearchModel.fromMap(json.decode(source));
}
