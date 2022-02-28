import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/weather/weather_page.dart';



class WeatherModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const WeatherPage()),
      ];
}
