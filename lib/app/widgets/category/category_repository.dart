import 'package:app_painel_hortifruti_pratico/app/data/models/product.dart';
import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';

class CategoryRepository {
  final Api _api;

  CategoryRepository(this._api);

  Future<List<ProductModel>> getProducts(int categoryId) =>
      _api.getProducts(categoryId);
}
