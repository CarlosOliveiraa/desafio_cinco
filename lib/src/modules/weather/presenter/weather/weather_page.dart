import 'package:flutter/material.dart';

import 'components/custom_textformfield.dart';
import 'components/weather_cards.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
    // return Scaffold(
    //   appBar: AppBar(),
    //   body: Padding(
    //     padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           CustomTextFormField(
    //             onTap: () {},
    //           ),
    //           AnimatedBuilder(
    //             animation: controller,
    //             builder: (_, child) {
    //               return ListView.builder(
    //                 scrollDirection: Axis.vertical,
    //                 shrinkWrap: true,
    //                 itemCount: controller.list.length,
    //                 itemBuilder: (_, index) {
    //                   // final weather = controller.list[index];
    //                   return Container(
    //                     padding: const EdgeInsets.all(10),
    //                     child: WeatherCard(
    //                       day: weather.day,
    //                       temperature: weather.temperature,
    //                       wind: weather.wind,
    //                     ),
    //                   );
    //                 },
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
