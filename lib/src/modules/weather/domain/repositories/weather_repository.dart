import 'package:dartz/dartz.dart';

import '../entities/weather_entity.dart';

abstract class IWeatherRepository {
  Future<Either<Exception, List<WeatherEntity>>> search(String? city);
}
