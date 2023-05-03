import 'package:app_painel_hortifruti_pratico/app/data/models/category.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/category_list/controller.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/category_list/widgets/delete_category/delete_category_widget.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/category_list/widgets/edit_category/edit_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef ItemSelectedCallback = void Function(CategoryModel category);

class CategoryListWidget extends StatelessWidget {
  final CategoryListController controller = Get.find();
  final ItemSelectedCallback onItemSelected;

  CategoryListWidget(
    this.onItemSelected, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView(
        children: [
          for (var category in state!)
            Obx(
              () => ListTile(
                title: Text('#${category.name}'),
                onTap: () => onItemSelected(category),
                selected: controller.categorySelected.value == category.id,
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Editar'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Excluir'),
                    ),
                  ],
                  onSelected: (value) {
                    switch (value) {
                      case 'delete':
                        Get.dialog(
                          DeleteCategoryWidget(
                            controller.categorySelected.value ?? category.id,
                          ),
                        );
                        break;
                      case 'edit':
                        Get.dialog(
                          EditCategoryWidget(
                            controller.categorySelected.value ?? category.id,
                          ),
                        );
                        break;
                      default:
                    }
                  },
                ),
              ),
            ),
        ],
      ),
      onEmpty: const Center(
        child: Text(
          'Você não tem nenhuma categoria',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
