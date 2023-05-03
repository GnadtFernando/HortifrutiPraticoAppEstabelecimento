import 'package:app_painel_hortifruti_pratico/app/data/models/category.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/category_request.dart';
import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';

class CategoryListRepository {
  final Api _api;

  CategoryListRepository(this._api);

  Future<List<CategoryModel>> getCategories() => _api.getCategories();

  Future<CategoryModel> putCategory(CategoryRequestModel category) =>
      _api.putCategory(category);

  Future<void> deleteCategory(int categoryId) =>
      _api.deleteCategory(categoryId);
}
