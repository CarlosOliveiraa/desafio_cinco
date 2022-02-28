import 'package:dartz/dartz.dart';
import 'package:desafio_cinco/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:desafio_cinco/src/modules/weather/domain/errors/erros.dart';
import 'package:desafio_cinco/src/modules/weather/domain/repositories/weather_repository.dart';
import 'package:desafio_cinco/src/modules/weather/domain/usecases/weather_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class IWeatherRepositoryMock extends Mock implements IWeatherRepository {}

void main() {
  final repository = IWeatherRepositoryMock();
  final usecase = WeatherUsecase(repository);

   var weatherResult = WeatherEntity(
    day: "um",
    temperature: "23",
    wind: "12",
    forecast: [],
    description: "asdf",
  );

  test('deve retornar uma lista de cidades', () async {
    when(() => repository.search(any()))
        .thenAnswer((_) async =>  Right(weatherResult));

    final result = await usecase("Curitiba");

    expect(result.fold(id, id), isA<WeatherEntity>());
  });
  test('deve retornar um InvalidTextError', () async {
    when(() => repository.search(any()))
        .thenAnswer((_) async =>  Right(weatherResult));

    var result = await usecase(null);

    expect(result.fold(id, id), isA<InvalidTextError>());
    result =  await usecase('');
    expect(result.fold(id, id), isA<InvalidTextError>());

  });
}
