import 'package:core_project/core/mixins/theme_data_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

abstract class MainScaffold extends HookWidget with ThemeDataMixin {
  const MainScaffold({Key? key}) : super(key: key);

  RxBool get loading => false.obs;

  Color get backgroundColor => Colors.white;
  bool get useCupertinoMethod => false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (useCupertinoMethod)
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: backgroundColor,
            body: Column(
              children: [
                appBar(context) != null
                    ? SafeArea(bottom: false, child: appBar(context)!)
                    : const SizedBox(),
                Expanded(
                  child: body(context),
                ),
              ],
            ),
          )
        else
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: backgroundColor,
            body: Column(
              children: [
                appBar(context) != null
                    ? SafeArea(bottom: false, child: appBar(context)!)
                    : const SizedBox(),
                Expanded(
                  child: body(context),
                ),
              ],
            ),
          ),
        overlayWidget(context)!,
        Obx(() => loading.value
            ? Container(
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                  color: Colors.black38,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  width: 80,
                  height: 80,
                  alignment: AlignmentDirectional.center,
                  // child: Center(
                  //     child: Image.asset(
                  //   Assets.gif.loading1,
                  //   width: 40,
                  // )),
                ),
              )
            : Container()),
      ],
    );
  }

  Widget? appBar(BuildContext context) {
    return null;
  }

  Widget body(BuildContext context);

  Widget? overlayWidget(BuildContext context) {
    return const SizedBox();
  }
}
