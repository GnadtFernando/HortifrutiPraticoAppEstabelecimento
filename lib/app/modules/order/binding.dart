import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/order/order_controller.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/order/order_repository.dart';

import 'package:get/get.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
        () => OrderController(OrderRepository(Get.find<Api>())));
  }
}
