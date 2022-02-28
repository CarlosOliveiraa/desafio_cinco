import 'package:dartz/dartz.dart';
import 'package:desafio_cinco/src/modules/weather/infra/models/weather_search_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_cinco/src/modules/app_module.dart';
import 'package:desafio_cinco/src/modules/weather/domain/usecases/weather_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

class DioMock extends Mock implements Dio {}

void main() {
  initModule(
    AppModule(),
  );

  (AppModule());

  test('Deve retornar um usecase sem erro', () {
    final usecase = Modular.get<IWeatherUsecase>();
    expect(usecase, isA<WeatherUsecase>());
  });
  test('Deve trazer uma lista de WeatherSearchModel', () async {
    final usecase = Modular.get<IWeatherUsecase>();
    final result = await usecase('Carlos');
    expect(result.fold(id, id), isA<List<WeatherSearchModel>>());
  });
}
