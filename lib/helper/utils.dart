import 'package:chefkart_task/helper/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils{
  Widget getCircularLoading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(color: colorPrimary),
      ],
    );
  }

  static showToastMessage(message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: colorPrimary.withOpacity(0.9),
        textColor: colorWhite,
        fontSize: 14.0
    );
  }
}