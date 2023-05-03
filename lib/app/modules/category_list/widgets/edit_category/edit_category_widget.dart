import 'package:app_painel_hortifruti_pratico/app/data/models/category_request.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/category_list/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategoryWidget extends StatelessWidget {
  EditCategoryWidget(this.categoryId, {super.key});
  final controller = Get.find<CategoryListController>();
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deseja alterar o nome da categoria?'),
      content: TextFormField(
        key: controller.categoriaKey,
        keyboardType: TextInputType.number,
        controller: controller.categoriaName,
        validator: (value) {
          final text = controller.categoriaName.value.text;
          if (text.isEmpty) {
            return 'Informe um nome';
          }
          return null;
        },
      ),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (controller.categoriaKey.currentState?.validate() ?? false) {
              controller.putCategory(
                CategoryRequestModel(
                  id: categoryId,
                  name: controller.categoriaName.text,
                ),
              );
            }
          },
          child: const Text('Alterar'),
        ),
      ],
    );
  }
}
