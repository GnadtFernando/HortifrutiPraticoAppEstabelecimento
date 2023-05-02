import 'package:app_painel_hortifruti_pratico/app/data/models/category.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/category_list/repository.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/category/category_controller.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController
    with StateMixin<List<CategoryModel>> {
  final CategoryListRepository _repository;
  CategoryListController(this._repository);

  final categorySelected = RxnInt();

  @override
  void onInit() {
    loadOrders();

    super.onInit();
  }

  Future<void> loadOrders() async {
    await _repository.getCategories().then((data) {
      var status = data.isEmpty ? RxStatus.empty() : RxStatus.success();
      change(data, status: status);
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void changeCategory(CategoryModel category) {
    categorySelected.value = category.id;
    Get.find<CategoryController>(tag: 'detail').categoryId.value = category.id;
  }
}
