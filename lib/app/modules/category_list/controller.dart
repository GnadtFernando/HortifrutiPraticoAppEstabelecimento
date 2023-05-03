import 'package:app_painel_hortifruti_pratico/app/data/models/category.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/category_request.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/category_list/repository.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/category/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController
    with StateMixin<List<CategoryModel>> {
  final CategoryListRepository _repository;
  CategoryListController(this._repository);

  final categorySelected = RxnInt();
  final categoriaName = TextEditingController();
  final categoriaKey = GlobalKey<FormFieldState>();

  @override
  void onInit() {
    loadCategories();

    super.onInit();
  }

  Future<void> loadCategories() async {
    await _repository.getCategories().then((data) {
      var status = data.isEmpty ? RxStatus.empty() : RxStatus.success();
      change(data, status: status);
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void putCategory(CategoryRequestModel category) async {
    await _repository.putCategory(category).then((data) {
      Get.back();
      categoriaName.clear();
      loadCategories();
    }, onError: (error) {
      Get.back();
      Get.dialog(AlertDialog(title: Text(error.toString())));
    });
  }

  void deleteCategory(int categoryId) async {
    await _repository.deleteCategory(categoryId).then((data) {
      Get.back();
      loadCategories();
    }, onError: (error) {
      Get.back();
      Get.dialog(AlertDialog(title: Text(error.toString())));
    });
  }

  void changeCategory(CategoryModel category) {
    categorySelected.value = category.id;
    Get.find<CategoryController>(tag: 'detail').categoryId.value = category.id;
  }
}
