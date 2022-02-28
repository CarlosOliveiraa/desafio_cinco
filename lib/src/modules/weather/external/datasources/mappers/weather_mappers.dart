import 'package:desafio_cinco/src/modules/weather/domain/entities/weather_entity.dart';

class ResultSearchMapper {
  static Map<String, dynamic> toMap(WeatherEntity resultSearch) {
    return {
      'temperature': resultSearch.temperature,
      'wind': resultSearch.wind,
      'description': resultSearch.description,
      'forecast': resultSearch.forecast,
      'day': resultSearch.day,
    };
  }

  static WeatherEntity fromJson(Map<String, dynamic> json) {
    return WeatherEntity(
      temperature: json['temperature'] ?? '',
      wind: json['wind'] ?? '',
      description: json['description'] ?? '',
      forecast: json['forecast'] == null
          ? []
          : List<WeatherEntity>.from(
              json['forecast'].map((e) => ResultSearchMapper.fromJson(e))),
      day: json['day'] ?? '',
    );
  }
}