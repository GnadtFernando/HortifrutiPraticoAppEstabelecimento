import 'package:app_painel_hortifruti_pratico/app/data/models/order.dart';
import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';

class OrderRepository {
  final Api _api;

  OrderRepository(this._api);

  Future<OrderModel> getOrder(String id) => _api.getOrder(id);

  Future<void> postOrderStatus(String id, int statusId) =>
      _api.postOrderStatus(id, statusId);
}
