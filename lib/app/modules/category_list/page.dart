import 'package:app_painel_hortifruti_pratico/app/modules/category_list/controller.dart';
import 'package:app_painel_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/category_detail/category_detail_widget.dart';
import 'widgets/order_list/category_list_widget.dart';

class CategoryListPage extends GetResponsiveView<CategoryListController> {
  CategoryListPage({super.key});

  @override
  Widget desktop() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Produtos'),
        actions: [
          TextButton(
            onPressed: () => Get.toNamed(Routes.product),
            child: const Text('Novo Produto'),
          ),
        ],
      ),
      body: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: CategoryListWidget(controller.changeCategory),
            ),
          ),
          Flexible(
            flex: 3,
            child: CategoryDetailWidget(),
          )
        ],
      ),
    );
  }

  @override
  Widget phone() {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Produtos')),
      body: CategoryListWidget(
        (category) => Get.toNamed(
          Routes.category.replaceFirst(':category_id', category.id.toString()),
        ),
      ),
    );
  }
}
