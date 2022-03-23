import 'package:core_project/app_config.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(AppConfig(
      appName: 'Liex Production',
      flavorName: AppFlavor.PRODUCTION,
      apiUrl: '',
      host: '',
      child: const MyApp()));
}
