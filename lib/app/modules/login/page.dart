import 'package:app_painel_hortifruti_pratico/app/modules/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Painel do Hortifruti Prático')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: Get.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Informe o seu email';
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
                        if (value != null && value.isEmpty) {
                          return 'Informe a sua senha';
                        }

                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Obx(
                              () {
                                if (controller.loading.isTrue) {
                                  return const ElevatedButton(
                                    onPressed: null,
                                    child: SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2)),
                                  );
                                }
                                return ElevatedButton(
                                  onPressed: controller.login,
                                  child: const Text('Entrar'),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
