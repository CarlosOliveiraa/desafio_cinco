import 'package:desafio_cinco/src/modules/app_module.dart';
import 'package:desafio_cinco/src/modules/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
