import 'package:app_painel_hortifruti_pratico/app/data/models/product.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/category/category_repository.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
    with StateMixin<List<ProductModel>> {
  final CategoryRepository _repository;
  CategoryController(this._repository);
  final categoryId = RxnInt();

  @override
  void onInit() {
    ever(categoryId, (_) => loadProducts());

    if (Get.currentRoute != '/' && Get.parameters.containsKey('category_id')) {
      categoryId.value = int.parse(Get.parameters['category_id']!);
    }

    super.onInit();
  }

  Future<void> loadProducts() async {
    change(state, status: RxStatus.loading());

    _repository.getProducts(categoryId.value!).then((data) {
      if (data.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(data, status: RxStatus.success());
      }
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
