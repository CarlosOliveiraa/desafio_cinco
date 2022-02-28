import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:desafio_cinco/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:desafio_cinco/src/modules/weather/domain/errors/erros.dart';
import 'package:desafio_cinco/src/modules/weather/infra/datasource/weather_datasource.dart';
import 'package:desafio_cinco/src/modules/weather/infra/models/weather_search_model.dart';
import 'package:desafio_cinco/src/modules/weather/infra/repositories/weather_repository_ipml.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class WeatherDataSourceMock extends Mock implements WeatherDataSource {}

void main() {
  final datasouce = WeatherDataSourceMock();
  final repository = WeatherRepositoryIpml(datasouce);

  test('Deve retornar uma lista de WeatherSearchModel', () async {
    when(() => datasouce.getWeather(any()))
        .thenAnswer((_) async => Right(WeatherSearchModel());
    final result = await repository.search("Curitiba");
    expect(result.fold(id, id), isA<List<WeatherEntity>>());
  });
  test('Deve retornar um datasourceerror se o datasource falhar', () async {
    when(() => datasouce.getWeather(any())).thenThrow(Exception());
    final result = await repository.search("Curitiba");
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
