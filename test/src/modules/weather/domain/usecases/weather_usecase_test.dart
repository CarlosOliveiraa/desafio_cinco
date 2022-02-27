import 'package:dartz/dartz.dart';
import 'package:desafio_cinco/src/modules/weather/domain/entities/weather_model.dart';
import 'package:desafio_cinco/src/modules/weather/domain/errors/erros.dart';
import 'package:desafio_cinco/src/modules/weather/domain/repositories/weather_repository.dart';
import 'package:desafio_cinco/src/modules/weather/domain/usecases/weather_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class IWeatherRepositoryMock extends Mock implements IWeatherRepository {}

void main() {
  final repository = IWeatherRepositoryMock();
  final usecase = WeatherUsecase(repository);

  test('deve retornar uma lista de cidades', () async {
    when(() => repository.search(any()))
        .thenAnswer((_) async => const Right(<WeatherModel>[]));

    final result = await usecase("Curitiba");

    expect(result.fold(id, id), isA<List<WeatherModel>>());
  });
  test('deve retornar um InvalidTextError', () async {
    when(() => repository.search(any()))
        .thenAnswer((_) async => const Right(<WeatherModel>[]));

    var result = await usecase(null);

    expect(result.fold(id, id), isA<InvalidTextError>());
    result =  await usecase('');
    expect(result.fold(id, id), isA<InvalidTextError>());

  });
}
