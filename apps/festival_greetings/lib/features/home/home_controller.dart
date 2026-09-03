import 'package:get/get.dart';

import '../../core/env/app_environment.dart';

class HomeController extends GetxController {
  HomeController({required this.environment});

  final AppEnvironment environment;

  String get variantLabel => environment.variant.name;
}
