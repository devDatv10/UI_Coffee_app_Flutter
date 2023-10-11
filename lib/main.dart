import 'package:coffeeappui/pages/home/home_page.dart';
import 'package:coffeeappui/pages/login_logout/login_page.dart';
import 'package:coffeeappui/pages/welcome_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

// void main() => runApp(const MyApp());
void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const WelComePage(),
      getPages: [
        GetPage(name: '/welcomepage', page: () => const WelComePage()),
        GetPage(name: '/homepage', page: () => const HomePage()),
      ],
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
