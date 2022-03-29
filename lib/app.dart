import 'package:core_project/core/util/util.dart';
import 'package:core_project/src/binding/auth_binding.dart';
import 'package:core_project/src/features/number_trivia/presentation/pages/blank_page.dart';
import 'package:core_project/src/router/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return GestureDetector(
      onTap: () {
        disableFocus(context, () async {});
      },
      child: GetMaterialApp(
        title: 'core_app',
        initialBinding: AuthBinding(),
        getPages: AppPages.pages,
        home: const BlankPage(),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
