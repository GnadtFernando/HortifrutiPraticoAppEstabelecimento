import 'package:app_painel_hortifruti_pratico/app/data/models/category.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/product.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/product_request.dart';
import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';

class ProductRepository {
  final Api _api;

  ProductRepository(this._api);

  Future<List<CategoryModel>> getCategories() => _api.getCategories();

  Future<ProductModel> postProduct(ProductRequestModel productRequest) =>
      _api.postProduct(productRequest);
}
