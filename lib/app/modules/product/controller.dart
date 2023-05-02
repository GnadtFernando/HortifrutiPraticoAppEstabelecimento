import 'package:app_painel_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/product.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/store.dart';
import 'package:app_painel_hortifruti_pratico/app/data/services/cart/service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final product = Rxn<ProductModel>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final observationController = TextEditingController();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    super.onInit();
  }

  void onAdd() {}
}
