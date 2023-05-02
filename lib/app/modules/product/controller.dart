import 'package:app_painel_hortifruti_pratico/app/data/models/product.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final product = Rxn<ProductModel>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final observationController = TextEditingController();

  final img = Rxn<PlatformFile>();

  @override
  void onInit() {
    // product.value = Get.arguments['product'];
    super.onInit();
  }

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true);

    if (result != null && result.files.isNotEmpty) {
      img.value = result.files.first;
    }
  }

  void onAdd() {}
}
