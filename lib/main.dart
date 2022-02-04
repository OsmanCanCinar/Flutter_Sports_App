import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_app/ui/home_page.dart';

void main() {
  runApp(_devicePreview());
  //runApp(_myApp());
}

GetMaterialApp _myApp() {
  return const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  );
}

DevicePreview _devicePreview() {
  return DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: const HomePage(),
    ),
  );
}
