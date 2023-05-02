import 'package:app_painel_hortifruti_pratico/app/data/models/order.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/order_list/repository.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/order/order_controller.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController
    with StateMixin<List<OrderModel>> {
  final OrderListRepository _repository;
  OrderListController(this._repository);

  final orderSelected = RxnString();

  @override
  void onInit() {
    loadOrders();

    super.onInit();
  }

  Future<void> loadOrders() async {
    await _repository.getOrders().then((data) {
      var status = data.isEmpty ? RxStatus.empty() : RxStatus.success();
      change(data, status: status);
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void changeOrder(OrderModel order) {
    orderSelected.value = order.hashId;
    Get.find<OrderController>(tag: 'detail').orderId.value = order.hashId;
  }
}
