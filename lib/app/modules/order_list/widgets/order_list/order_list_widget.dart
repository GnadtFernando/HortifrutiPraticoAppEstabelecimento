import 'package:app_painel_hortifruti_pratico/app/modules/order_list/controller.dart';
import 'package:app_painel_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListWidget extends StatelessWidget {
  final OrderListController controller = Get.find();
  OrderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView(
        children: [
          for (var order in state!)
            ListTile(
              title: Text('#${order.hashId}'),
              // subtitle: Text(order.store.name),
              trailing: Chip(
                label: SizedBox(
                  width: 70,
                  child: Text(
                    order.statusList.last.name,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () =>
                  Get.toNamed(Routes.order.replaceFirst(':id', order.hashId)),
            )
        ],
      ),
      onEmpty: const Center(
        child: Text(
          'Você não recebeu nenhum pedido.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
