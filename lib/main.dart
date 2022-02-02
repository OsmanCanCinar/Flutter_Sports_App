import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/ui/detail_page.dart';
import 'package:sports_app/ui/home_page.dart';

void main() {
  runApp(_devicePreview());
}

DevicePreview _devicePreview() {
  return DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
      }
    ),
  );
}
