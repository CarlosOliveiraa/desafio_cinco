import 'package:flutter/material.dart';

import '../../../domain/entities/weather_entity.dart';

class WeatherCard extends StatelessWidget {
  final double width;
  final double height;
  final IconData? icon;
  final String? day;
  final String? temperature;
  final String? wind;
  final WeatherEntity? result;
  final String? description;

  const WeatherCard({
    Key? key,
    this.width = 400,
    this.height = 100,
    this.icon,
    this.day,
    this.temperature,
    this.wind,
    this.result,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.location_city,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Day: ${result!.day}",
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.water,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text("Temperature: ${result!.temperature}",
                  style: const TextStyle(fontSize: 20))
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.air,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text("Wind: ${result!.wind}",
                  style: const TextStyle(fontSize: 20))
            ],
          ),
        ],
      ),
    );
  }
}
