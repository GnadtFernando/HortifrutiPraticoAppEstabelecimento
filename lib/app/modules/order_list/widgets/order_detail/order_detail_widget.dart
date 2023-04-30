import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/order/repository.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/order_list/controller.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/order/order_controller.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/order/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailWidget extends StatelessWidget {
  OrderDetailWidget({super.key});
  final controller = Get.put(OrderController(OrderRepository(Get.find<Api>())),
      tag: 'detail', permanent: true);
  final orderListController = Get.find<OrderListController>();

  @override
  Widget build(BuildContext context) {
    return ObxValue((orderSelected) {
      if (orderSelected.value == null) {
        return const Center(
          child: Text('Clique em um pedido ao lado para ver os detalhes'),
        );
      }

      return controller.obx(
        (state) => OrderWidget(state!, tag: 'detail'),
      );
    }, orderListController.orderSelected);
  }
}
