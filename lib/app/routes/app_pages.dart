import 'package:get/get.dart';

/// Application page registry for GetX routing.
///
/// Each feature registers its pages here.
/// Pages are added incrementally as features are implemented.
class AppPages {
  AppPages._();

  /// The initial route when the app starts.
  static const String initialRoute = '/';

  /// All registered pages in the application.
  ///
  /// Features add their [GetPage] entries here during implementation.
  static final List<GetPage<dynamic>> pages = [
    // Pages will be registered here as features are implemented.
    // Example:
    // GetPage(
    //   name: AppRoutes.login,
    //   page: () => const LoginPage(),
    //   binding: LoginBinding(),
    // ),
  ];
}
