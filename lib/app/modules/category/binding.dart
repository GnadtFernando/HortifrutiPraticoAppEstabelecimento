import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/category/category_controller.dart';
import 'package:app_painel_hortifruti_pratico/app/widgets/category/category_repository.dart';

import 'package:get/get.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
        () => CategoryController(CategoryRepository(Get.find<Api>())));
  }
}
