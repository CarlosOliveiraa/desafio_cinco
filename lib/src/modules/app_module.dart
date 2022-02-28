import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'weather/domain/usecases/weather_usecase.dart';
import 'weather/external/datasources/api_datasource.dart';
import 'weather/infra/repositories/weather_repository_ipml.dart';
import 'weather/presenter/weather/weather_bloc/weather_bloc.dart';
import 'weather/weather_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => ApiDatasource(i())),
        Bind((i) => WeatherRepositoryIpml(i())),
        Bind((i) => WeatherUsecase(i())),
        Bind((i) => WeatherBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/weatherPage", module: WeatherModule()),
      ];
}
