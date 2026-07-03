import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  // Routes mapping setup.
  // Note: No business screens implemented as per instructions.
  static final List<GetPage<dynamic>> pages = [
    // GetPage<dynamic>(
    //   name: AppRoutes.login,
    //   page: () => const LoginViewPlaceholder(),
    //   binding: LoginBinding(),
    // ),
  ];

  static final GetPage<dynamic> unknownRoute = GetPage<dynamic>(
    name: AppRoutes.unknown,
    page: () => const Scaffold(body: Center(child: Text('404'))),
  );
}
