import 'package:app_painel_hortifruti_pratico/app/modules/product/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var product = controller.product.value!;

    return Scaffold(
      appBar: AppBar(title: const Text('Novo produto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Informe o nome do produto';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                    ),
                    minLines: 1,
                    maxLength: 3,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          controller: controller.priceController,
                          decoration: const InputDecoration(
                            labelText: 'Preço',
                          ),
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Informe o preço do produto';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 150,
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            labelText: 'Unidade',
                          ),
                          items: ['UN', 'KG']
                              .map(
                                (unit) => DropdownMenuItem(
                                  value: unit,
                                  child: Text(unit),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                        onPressed: () => controller.onAdd(),
                        child: const Text('Adicionar')),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
