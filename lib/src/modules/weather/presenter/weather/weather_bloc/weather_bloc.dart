import 'package:flutter_bloc/flutter_bloc.dart';
import 'states/state.dart';

class WeatherBloc extends Bloc<String, WeatherState> {
  WeatherBloc(initialState) : super(initialState);
}
