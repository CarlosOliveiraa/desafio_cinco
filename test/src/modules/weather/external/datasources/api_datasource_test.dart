import 'dart:convert';

import 'package:desafio_cinco/src/modules/weather/domain/errors/erros.dart';
import 'package:desafio_cinco/src/modules/weather/external/datasources/api_datasource.dart';
import 'package:desafio_cinco/src/modules/weather/utils/weather_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = ApiDatasource(dio);
  final _requestOptions = RequestOptions(path: "");

  test('Deve retornar uma lista de WeatherSearchModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(weatherApi),
        statusCode: 200,
        requestOptions: _requestOptions));
    final future = datasource.getWeather("Curitiba");

    expect(future, completes);
  });
  test('Deve retornar um erro se o codigo não for 200', () async {
    when(() => dio.get(any())).thenAnswer((_) async =>
        Response(data: null, statusCode: 401, requestOptions: _requestOptions));
    final future = datasource.getWeather("Curitiba");

    expect(future, throwsA(isA<DatasourceError>()));
  });
  test('Deve retornar um erro se tiver erro no dio', () async {
    when(() => dio.get(any())).thenThrow(Exception());
    final future = datasource.getWeather("Curitiba");

    expect(future, throwsA(isA<Exception>()));
  });
}
