import 'package:desafio_cinco/src/modules/weather/domain/errors/erros.dart';
import 'package:desafio_cinco/src/modules/weather/infra/datasource/weather_datasource.dart';
import 'package:desafio_cinco/src/modules/weather/infra/models/weather_search_model.dart';
import 'package:dio/dio.dart';

class ApiDatasource implements WeatherDataSource {
  final Dio dio;

  ApiDatasource(this.dio);

  @override
  Future<List<WeatherSearchModel>> getWeather(String? city) async {
    final response =
        await dio.get("https://goweather.herokuapp.com/weather/$city");
    print(response);

    if (response.statusCode == 200) {
      var list = (response.data['forecast'] as List)
          .map((e) => WeatherSearchModel.fromJson(e))
          .toList();
      return list;
    } else {
      throw DatasourceError();
    }
  }
}
