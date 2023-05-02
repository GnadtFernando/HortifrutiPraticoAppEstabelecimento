import 'package:app_painel_hortifruti_pratico/app/data/services/storage/service.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/category/binding.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/category/page.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/dashboard/binding.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/dashboard/page.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/login/binding.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/login/page.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/order/binding.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/order/page.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/binding.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/page.dart';
import 'package:app_painel_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.dashboard,
        page: () => DashboardPage(),
        binding: DashboardBinding(),
        middlewares: [RedirectMiddleware()]),
    GetPage(
      name: Routes.category,
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.product,
      page: () => const ProductPage(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.order,
      page: () => const OrderPage(),
      binding: OrderBinding(),
    ),
  ];
}

class RedirectMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Get.find<StorageService>().token == null) {
      return const RouteSettings(name: Routes.login);
    }
    return null;
  }
}
