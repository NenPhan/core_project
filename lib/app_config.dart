import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    Key? key,
    required this.appName,
    required this.flavorName,
    required this.apiUrl,
    required this.host,
    required Widget child,
  }) : super(key: key, child: child) {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (isDevelopment) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception,
            details.stack ?? StackTrace.fromString("stackTraceString"));
      }
    };
  }

  final String appName;
  final AppFlavor flavorName;
  final String apiUrl;
  final String host;

  bool get isDevelopment => flavorName == AppFlavor.DEVELOPMENT;

  static AppConfig? get instance =>
      Get.context?.dependOnInheritedWidgetOfExactType(aspect: AppConfig);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

// ignore: constant_identifier_names
enum AppFlavor { DEVELOPMENT, TEST, PRODUCTION }
