import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';

class DeleteProductImageRepository {
  final Api _api;

  DeleteProductImageRepository(this._api);

  Future<void> deleteProductImage(int productId) =>
      _api.deleteProductImage(productId);
}
