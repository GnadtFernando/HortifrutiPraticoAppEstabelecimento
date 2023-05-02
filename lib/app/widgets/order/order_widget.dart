import 'package:app_painel_hortifruti_pratico/app/data/models/order.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/order_product.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/order/order_controller.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/order_next_status/order_next_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatelessWidget {
  final OrderModel order;
  final OrderController controller;
  OrderWidget(this.order, {String? tag, super.key})
      : controller = Get.find<OrderController>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '#${order.hashId}',
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                  Text(
                      'Data: ${DateFormat("dd/MM/y 'às' HH:mm").format(order.createdAt)}')
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Endereço de entrega'.toUpperCase(),
            style: Get.textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
              '${order.address!.street}, n° ${order.address!.number}, ${order.address!.neighborhood}'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Andamento do pedido'.toUpperCase(),
            style: Get.textTheme.titleMedium,
          ),
        ),
        for (var status in order.statusList)
          ListTile(
            title: Text(status.name),
            trailing: Text(DateFormat.Hm().format(status.createAt)),
          ),
        OrderNextStatusWidget(
          order.statusList.last,
          controller.onSendStatus,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Produtos'.toUpperCase(),
            style: Get.textTheme.titleMedium,
          ),
        ),
        for (var orderProduct in order.productList)
          ListTile(
            title: Text(orderProduct.product.name),
            leading: _buildProductQuantity(orderProduct),
            trailing:
                Text(NumberFormat.simpleCurrency().format(orderProduct.total)),
          ),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Expanded(child: Text('Custo de entrega')),
              Text(NumberFormat.simpleCurrency().format(order.deliveryCost))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                'Total',
                style: Get.textTheme.titleMedium,
              )),
              Text(
                NumberFormat.simpleCurrency().format(order.value),
                style: Get.textTheme.titleMedium,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductQuantity(OrderProductModel orderProduct) {
    return Text(NumberFormat.decimalPattern().format(orderProduct.quantity) +
        (orderProduct.product.isKg ? 'kg' : 'x'));
  }
}
