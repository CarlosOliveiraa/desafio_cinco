import 'package:desafio_cinco/src/modules/weather/domain/entities/weather_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:desafio_cinco/src/modules/weather/infra/datasource/weather_datasource.dart';

import '../../domain/errors/erros.dart';
import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryIpml implements IWeatherRepository {
  final WeatherDataSource dataSource;

  WeatherRepositoryIpml(this.dataSource);

  @override
  Future<Either<Exception, WeatherEntity>> search(String? city) async {
    try {
      final result = await dataSource.getWeather(city);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
