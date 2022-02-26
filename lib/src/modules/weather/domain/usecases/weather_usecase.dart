import 'package:dartz/dartz.dart';
import 'package:desafio_cinco/src/modules/weather/domain/errors/erros.dart';
import 'package:desafio_cinco/src/modules/weather/domain/repositories/weather_repository.dart';
import '../entities/weather_model.dart';

abstract class IWeatherUsecase {
  Future<Either<Exception, List<WeatherModel>>> call(String city);
}

class WeatherUsecase implements IWeatherUsecase {
  final IWeatherRepository repository;

  WeatherUsecase(this.repository);

  @override
  Future<Either<Exception, List<WeatherModel>>> call(String? city) async {
    if (city == null) {
      return Left(InvalidTextError());
    }

    return repository.search(city);
  }
}
