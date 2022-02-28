import 'package:desafio_cinco/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:desafio_cinco/src/modules/weather/infra/datasource/weather_datasource.dart';
import 'package:desafio_cinco/src/modules/weather/infra/models/weather_search_model.dart';
import 'package:dio/dio.dart';

import 'mappers/weather_mappers.dart';

class ApiDatasource implements WeatherDataSource {
  final Dio dio;

  ApiDatasource(this.dio);

  @override
  Future<WeatherEntity> getWeather(String? city) async {
    final response =
        await dio.get("https://goweather.herokuapp.com/weather/$city");
    WeatherEntity resultWeather = ResultSearchMapper.fromJson(response.data);
    return resultWeather;
  }
}
