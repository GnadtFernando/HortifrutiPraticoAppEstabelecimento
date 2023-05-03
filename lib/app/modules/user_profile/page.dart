import 'package:app_painel_hortifruti_pratico/app/modules/user_profile/controller.dart';
import 'package:app_painel_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfilePage extends GetResponsiveView<UserProfileController> {
  UserProfilePage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),
      body: Column(
        children: [
          if (screen.isPhone) ...[
            _buildForm(),
            const SizedBox(height: 16),
            _buildPickAndShowImage(),
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

  Widget _buildPickAndShowImage() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Logo',
            style: Get.textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 16),
        // Obx(
        //   () {
        //     // if (controller.img.value != null) {
        //     //   return _buildProductImage(
        //     //     Image.memory(controller.img.value!.bytes!),
        //     //   );
        //     // }

        //     // if (controller.currentImg.value?.isNotEmpty ?? false) {
        //     //   return Column(
        //     //     children: [
        //     //       Padding(
        //     //         padding: const EdgeInsets.only(top: 8, bottom: 16),
        //     //         child: OutlinedButton(
        //     //           onPressed: controller.onDeleteImage,
        //     //           style: OutlinedButton.styleFrom(
        //     //             foregroundColor: Colors.red,
        //     //           ),
        //     //           child: const Text('Excluir imagem'),
        //     //         ),
        //     //       ),
        //     //       _buildProductImage(
        //     //         FadeInImage.memoryNetwork(
        //     //           placeholder: kTransparentImage,
        //     //           image: controller.currentImg.value!,
        //     //         ),
        //     //       ),
        //     //     ],
        //     //   );
        //     // }

        //     return const SizedBox();
        //   },
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: OutlinedButton(
            //  controller.pickImage
            onPressed: () {},
            child: const Text('Selecionar uma imagem'),
          ),
        )
      ],
    );
  }

  Obx _buildForm() {
    return Obx(() {
      if (controller.loading.isTrue) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (!controller.isLogged) {
        return Center(
            child: ElevatedButton(
          onPressed: () => Get.toNamed(Routes.login),
          child: const Text('Entrar com a minha conta'),
        ));
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Preencha o seu nome';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Preencha o seu email';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    obscureText: true,
                    validator: (String? value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length < 8) {
                        return 'Informe uma senha válida maior que 8 caracteres';
                      }

                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Aberto para pedidos?'),
                          Switch(
                            value: true,
                            onChanged: (bool value) {
                              value = !value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: controller.submit,
                              child: const Text('Atualizar')),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: controller.logout,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                          child: const Text('Sair da minha conta'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
