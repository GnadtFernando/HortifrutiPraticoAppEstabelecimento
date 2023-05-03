import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/widgets/new_category/new_category_controller.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/widgets/new_category/new_category_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCategoryWidget extends StatelessWidget {
  NewCategoryWidget({super.key});
  final controller =
      Get.put(NewCategoryController(NewCategoryRepository(Get.find<Api>())));

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nova Categoria'),
      scrollable: true,
      content: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Informe o nome da categoria';
                }
                return null;
              },
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text('Fechar'),
        ),
        Obx(
          () => TextButton(
            onPressed: controller.loading.isTrue ? null : controller.onSubmit,
            child: const Text('Adicionar'),
          ),
        ),
      ],
    );
  }
}
