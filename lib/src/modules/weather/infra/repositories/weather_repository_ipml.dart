import 'package:desafio_cinco/src/modules/weather/domain/entities/weather_model.dart';

import 'package:dartz/dartz.dart';
import 'package:desafio_cinco/src/modules/weather/infra/datasource/weather_datasource.dart';

import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryIpml implements IWeatherRepository {
  final WeatherDataSource dataSource;

  WeatherRepositoryIpml(this.dataSource);

  @override
  Future<Either<Exception, List<WeatherModel>>> search(String? city) async {
    final result = await dataSource.getWeather(city);
    return Right(result!);
  }
}
