import 'package:desafio_cinco/src/modules/weather/domain/entities/weather_entity.dart';

class WeatherSearchModel extends WeatherEntity {
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

  factory WeatherSearchModel.fromJson(Map<String, dynamic> json) {
    return WeatherSearchModel(
      temperature: json['temperature'] ?? '',
      wind: json['wind'] ?? '',
      description: json['description'] ?? '',
      forecast: json['forecast'] == null
          ? []
          : List<String>.from(
              json['forecast'].map((e) => WeatherSearchModel.fromJson(e))),
      day: json['day'] ?? '',
    );
  }
}
