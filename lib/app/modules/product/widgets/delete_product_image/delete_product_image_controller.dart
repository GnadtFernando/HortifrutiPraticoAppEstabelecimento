import 'package:app_painel_hortifruti_pratico/app/data/models/product.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/widgets/delete_product_image/delete_product_image_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteProductImageController extends GetxController {
  final DeleteProductImageRepository _repository;
  DeleteProductImageController(this._repository);

  final loading = false.obs;
  final product = Rxn<ProductModel>();

  @override
  void onInit() {
    product.value = Get.arguments;
    super.onInit();
  }

  void onSubimit() {
    loading(true);

    _repository.deleteProductImage(product.value!.id).then((_) async {
      Get.back(result: true);
    }, onError: (error) {
      Get.dialog(AlertDialog(title: Text(error.toString())));
    }).whenComplete(() => loading(false));
  }
}
