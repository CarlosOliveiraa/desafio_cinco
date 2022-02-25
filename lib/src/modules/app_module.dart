import 'package:desafio_cinco/src/modules/product/product_module.dart';

import 'package:desafio_cinco/src/modules/weather/weather_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/weatherPage", module: WeatherModule()),
        ModuleRoute("/productPage", module: ProductModule()),
      ];
}
