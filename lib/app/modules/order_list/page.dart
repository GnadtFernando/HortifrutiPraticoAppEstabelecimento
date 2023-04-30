import 'package:app_painel_hortifruti_pratico/app/modules/order_list/controller.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/order_list/widgets/order_detail/order_detail_widget.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/order_list/widgets/order_list/order_list_widget.dart';
import 'package:app_painel_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListPage extends GetResponsiveView<OrderListController> {
  OrderListPage({super.key});

  @override
  Widget desktop() {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Pedidos')),
      body: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: OrderListWidget(controller.changeOrder),
            ),
          ),
          Flexible(
            flex: 3,
            child: OrderDetailWidget(),
          )
        ],
      ),
    );
  }

  @override
  Widget phone() {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Pedidos')),
      body: OrderListWidget(
        (order) => Get.toNamed(
          Routes.order.replaceFirst(':id', order.hashId),
        ),
      ),
    );
  }
}
