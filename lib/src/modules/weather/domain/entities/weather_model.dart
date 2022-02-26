class WeatherModel {
  final String temperature;
  final String wind;
  final String description;
  final List<String> forecast;
  final String day;

  WeatherModel({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,
    required this.day,
  });
}
