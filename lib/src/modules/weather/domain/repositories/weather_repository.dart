import 'package:dartz/dartz.dart';

import '../entities/weather_model.dart';

abstract class IWeatherRepository {
  Future<Either<Exception, List<WeatherModel>>> search(String? city);
}
