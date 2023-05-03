import 'package:app_painel_hortifruti_pratico/app/modules/category_list/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteCategoryWidget extends StatelessWidget {
  DeleteCategoryWidget(this.categoryId, {super.key});
  final controller = Get.find<CategoryListController>();
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deseja realmente deletar a categoria?'),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text('Cancelar'),
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          onPressed: () => controller.deleteCategory(categoryId),
          child: const Text('Excluir'),
        ),
      ],
    );
  }
}
