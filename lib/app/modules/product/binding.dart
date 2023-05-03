import 'package:app_painel_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/controller.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/repository.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
        () => ProductController(ProductRepository(Get.find<Api>())));
  }
}
