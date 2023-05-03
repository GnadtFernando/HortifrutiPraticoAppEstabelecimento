import 'package:app_painel_hortifruti_pratico/app/routes/routes.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/category/category_controller.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/category/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos da Categoria'),
        actions: [
          TextButton(
            onPressed: () => Get.toNamed(
              Routes.product,
              parameters: {
                'category_id': controller.categoryId.value.toString()
              },
            ),
            child: const Text('Novo Produto'),
          ),
        ],
      ),
      body: CategoryWidget(),
    );
  }
}
