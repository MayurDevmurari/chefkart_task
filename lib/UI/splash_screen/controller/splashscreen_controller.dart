import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefkart_task/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreenController extends GetxController{
  Future<void> checkInterNetConnection() async{
    if (await networkCheck()) {
      AwesomeDialog(
        context: Get.context!,
        dismissOnBackKeyPress: false,
        autoDismiss: false,
        dismissOnTouchOutside: false,
        onDismissCallback: (dismissType){},
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'No Network Found',
        desc: 'Please check your internet connection',
        btnOkText: 'Retry',
        btnCancelOnPress: () {
          exit(0);
        },
        btnOkOnPress: () {
          Navigator.of(Get.context!).pop();
          checkInterNetConnection();
        },
      ).show();
    }else{
      // redirect on next screen after some second delay
      Timer(
          const Duration(seconds: 3),
              () => Get.toNamed(Routes.dishesScreen)
      );
    }
  }

  Future<bool> networkCheck() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return false;
      } else {
        return true;
      }
    } on SocketException catch (_) {
      return true;
    }
  }
}