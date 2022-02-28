abstract class WeatherEvents {}

class WeatherSearch extends WeatherEvents {
  final String weatherText;

  WeatherSearch(this.weatherText);
}
