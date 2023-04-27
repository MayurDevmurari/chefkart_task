import 'dart:io';

import 'package:chefkart_task/helper/common_font.dart';
import 'package:chefkart_task/helper/logger_utils.dart';
import 'package:chefkart_task/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      theme: ThemeData(
          fontFamily: Fonts.fontFamily
      ),
      logWriterCallback: Logger.write,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
      title: 'Chef Kart',
    );
  }
}
