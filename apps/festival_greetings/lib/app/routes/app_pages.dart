import 'package:get/get.dart';

import '../../features/home/home_binding.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/settings/pages/settings_page.dart';
import '../../features/settings/settings_binding.dart';
import 'app_routes.dart';

abstract final class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(name: AppRoutes.home, page: HomePage.new, binding: HomeBinding()),
    GetPage(
      name: AppRoutes.settings,
      page: SettingsPage.new,
      binding: SettingsBinding(),
    ),
  ];
}
