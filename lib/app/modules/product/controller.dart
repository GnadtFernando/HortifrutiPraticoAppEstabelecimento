import 'package:app_painel_hortifruti_pratico/app/data/models/category.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/product.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/product_request.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/repository.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/widgets/new_category/new_category_widget.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository _repository;
  ProductController(this._repository);

  final formKey = GlobalKey<FormState>();

  final product = Rxn<ProductModel>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final observationController = TextEditingController();
  final unitOfMeasure = RxString('UN');
  final img = Rxn<PlatformFile>();
  final loading = false.obs;

  final categoryList = RxList<CategoryModel>.empty();
  final categoryId = RxnInt();
  @override
  void onInit() async {
    await loadCategories();
    // product.value = Get.arguments['product'];
    super.onInit();
  }

  Future<void> loadCategories() async {
    await _repository.getCategories().then((data) => {
          categoryList.assignAll(data),
        });
  }

  void changeCategory(int? categorySelected) {
    categoryId.value = categorySelected;
  }

  void changeUnityOfMeasure(String? value) {
    unitOfMeasure.value = value!;
  }

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true);

    if (result != null && result.files.isNotEmpty) {
      img.value = result.files.first;
    }
  }

  void onAdd() {
    Get.focusScope!.unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }
    var productRequest = ProductRequestModel(
      name: nameController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      unitOfMeasure: unitOfMeasure.value,
      categoryId: categoryId.value!,
      image: img.value,
    );

    loading(true);
    _repository.postProduct(productRequest).then((product) async {
      Get.back();
    }, onError: (error) {
      Get.dialog(AlertDialog(title: Text(error.toString())));
    }).whenComplete(() => loading(false));
  }

  void goToNewCategory() {
    Get.dialog(NewCategoryWidget());
  }
}
