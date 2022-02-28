import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/weather_usecase.dart';
import 'events/weather_events.dart';
import 'states/state.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherState> {
  final IWeatherUsecase usecase;

  WeatherBloc(this.usecase) : super(WeatherStart()){
    on<WeatherSearch>(getWeather);
  }
  
  getWeather(WeatherSearch event, Emitter<WeatherState> emit) async {
    emit(WeatherLoad());
    final result = await usecase.call(event.weatherText);
    emit(result.fold((l) => WeatherError(l), (r) => WeatherSuccess(r)));
    
  }
  
}
