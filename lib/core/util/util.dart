import 'package:core_project/core/network/network_info.dart';
import 'package:core_project/core/util/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

disableFocus(BuildContext context, Future Function() onRequest,
    {GlobalKey<FormState>? formKey}) async {
  FocusManager.instance.primaryFocus?.unfocus();
  if (formKey == null) {
    await onRequest();
    return;
  }
  if (formKey.currentState!.validate()) {
    await onRequest();
  }
}

Future<bool> checkNetwork() async {
  var networkInfo = Get.find<NetworkInfo>();

  if (await networkInfo.isConnected) {
    return true;
  } else {
    showToast('Network not connected', ToastType.fail);
    return false;
  }
}
