import 'package:app_painel_hortifruti_pratico/app/modules/product/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends GetResponsiveView<ProductController> {
  ProductPage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo produto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            if (screen.isPhone) ...[
              _buildForm(),
              const SizedBox(height: 16),
              _buildPickAndShowImage(),
              _buildSubmit(),
            ] else ...[
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildForm(),
                              _buildSubmit(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(child: _buildPickAndShowImage())
                      ],
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }

  Row _buildSubmit() {
    return Row(
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
    );
  }

  Form _buildForm() {
    return Form(
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
    );
  }

  Widget _buildPickAndShowImage() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Imagem do produto',
            style: Get.textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () {
            if (controller.img.value != null) {
              return _buildProductImage(
                Image.memory(controller.img.value!.bytes!),
              );
            }
            return const SizedBox();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: OutlinedButton(
            onPressed: controller.pickImage,
            child: const Text('Selecionar uma imagem'),
          ),
        )
      ],
    );
  }

  Widget _buildProductImage(Widget image) {
    return Align(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 250),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: image,
        ),
      ),
    );
  }
}
