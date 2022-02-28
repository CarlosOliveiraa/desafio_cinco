import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio_cinco/src/modules/weather/domain/usecases/weather_usecase.dart';
import 'package:desafio_cinco/src/modules/weather/infra/models/weather_search_model.dart';
import 'package:desafio_cinco/src/modules/weather/presenter/weather/weather_bloc/events/weather_events.dart';
import 'package:desafio_cinco/src/modules/weather/presenter/weather/weather_bloc/states/state.dart';
import 'package:desafio_cinco/src/modules/weather/presenter/weather/weather_bloc/weather_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class IWeatherUsecaseMock extends Mock implements IWeatherUsecase {}

void main() {
  final usecase = IWeatherUsecaseMock();
  blocTest<WeatherBloc, WeatherState>(
    "Deve retornar os estados na ordem correta",
    build: () {
      when(() => usecase.call(any()))
          .thenAnswer((_) async => const Right(<WeatherSearchModel>[]));
      return WeatherBloc(usecase);
    },
    act: (bloc) => bloc.add(WeatherSearch("Carlos")),
    expect: () => [
      isA<WeatherLoad>(),
      isA<WeatherSuccess>(),
    ],
  );
}
