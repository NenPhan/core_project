import 'package:core_project/app_config.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(AppConfig(
      appName: 'Core Development',
      flavorName: AppFlavor.DEVELOPMENT,
      apiUrl: '',
      host: '',
      child: const MyApp()));
}
