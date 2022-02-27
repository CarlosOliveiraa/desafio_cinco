class WeatherEntity {
  final String temperature;
  final String wind;
  final String description;
  final List<dynamic> forecast;
  final String day;

  WeatherEntity({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,
    required this.day,
  });
}
