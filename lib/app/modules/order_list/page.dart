import 'package:app_painel_hortifruti_pratico/app/modules/order_list/controller.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/order_list/widgets/order_list/order_list_widget.dart';
import 'package:app_painel_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListPage extends GetView<OrderListController> {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Pedidos')),
      body: OrderListWidget(),
    );
  }
}
