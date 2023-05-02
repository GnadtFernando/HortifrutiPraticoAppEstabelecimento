import 'package:app_painel_hortifruti_pratico/app/data/models/order.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/order_list/controller.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/order/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with StateMixin<OrderModel> {
  final OrderRepository _repository;
  OrderController(this._repository);
  final orderId = RxnString();

  @override
  void onInit() {
    String? id = Get.parameters['id'];
    ever(orderId, (String? id) => loadOrder());

    if (id != null) {
      orderId.value = id;
    }

    super.onInit();
  }

  Future<void> loadOrder() async {
    change(state, status: RxStatus.loading());

    _repository.getOrder(orderId.value!).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<void> onSendStatus(int statusId) async {
    _repository.postOrderStatus(orderId.value!, statusId).then((data) async {
      await loadOrder();

      await Get.find<OrderListController>().loadOrders();
    }, onError: (error) {
      Get.dialog(
        AlertDialog(
          title: Text(error.toString()),
        ),
      );
    });
  }
}
