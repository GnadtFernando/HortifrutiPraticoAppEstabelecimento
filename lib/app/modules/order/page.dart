import 'package:app_painel_hortifruti_pratico/app/widgets/order/order_controller.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/order/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do pedido')),
      body: controller.obx((state) => OrderWidget(state!)),
    );
  }
}
