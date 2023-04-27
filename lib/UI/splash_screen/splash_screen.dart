import 'package:chefkart_task/UI/splash_screen/controller/splashscreen_controller.dart';
import 'package:chefkart_task/helper/color_constant.dart';
import 'package:chefkart_task/helper/common_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: colorWhite,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashScreenController.checkInterNetConnection();
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: colorWhite,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
              color: Colors.transparent,
              width: Get.width,
              child: Image.asset(CommonImages.chefKartLogo),
          ),
        ),
      ),
    );
  }
}
