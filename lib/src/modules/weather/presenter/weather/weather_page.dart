import 'package:desafio_cinco/src/modules/weather/presenter/weather/weather_bloc/events/weather_events.dart';
import 'package:desafio_cinco/src/modules/weather/presenter/weather/weather_bloc/states/state.dart';
import 'package:desafio_cinco/src/modules/weather/presenter/weather/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/custom_textformfield.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final bloc = Modular.get<WeatherBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? _weatherText;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                onChanged: (value) {
                  _weatherText = value;
                },
                onTap: () {
                  bloc.add(WeatherSearch(_weatherText!));
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<WeatherBloc, WeatherState>(
                  bloc: bloc,
                  builder: (contex, state) {
                    if (state is WeatherStart) {
                      return const Center(
                        child: Text("Nenhuma informação"),
                      );
                    }
                    if (state is WeatherLoad) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is WeatherError) {
                      return const Center(
                        child: Text("Houve um erro"),
                      );
                    }
                    final result = (state as WeatherSuccess).list;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: Column(
                        children: [
                          Text(result.temperature),
                          Text(result.wind),
                          Text(result.description),
                        ],
                      ),
                    );
                  }),
              // AnimatedBuilder(
              //   animation: ,
              //   builder: (_, child) {
              //     return ListView.builder(
              //       scrollDirection: Axis.vertical,
              //       shrinkWrap: true,
              //       itemCount: controller.list.length,
              //       itemBuilder: (_, index) {
              //         // final weather = controller.list[index];
              //         return Container(
              //           padding: const EdgeInsets.all(10),
              //           child: WeatherCard(
              //             day: weather.day,
              //             temperature: weather.temperature,
              //             wind: weather.wind,
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
