import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/category/category_controller.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/category/category_repository.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/category/category_widget.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/category_list/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailWidget extends StatelessWidget {
  CategoryDetailWidget({super.key});
  final controller = Get.put(
    CategoryController(CategoryRepository(Get.find<Api>())),
    tag: 'detail',
    permanent: true,
  );
  final categoryListController = Get.find<CategoryListController>();

  @override
  Widget build(BuildContext context) {
    return ObxValue((categorySelected) {
      if (categorySelected.value == null) {
        return const Center(
          child: Text('Clique em uma categoria ao lado para ver os produtos'),
        );
      }
      return CategoryWidget(tag: 'detail');
    }, categoryListController.categorySelected);
  }
}
