import 'package:app_painel_hortifruti_pratico/app/data/models/user_login_request.dart';
import 'package:app_painel_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:app_painel_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final _authService = Get.find<AuthService>();
  final emailController = TextEditingController(text: 'webevolui@email.com');
  final passwordController = TextEditingController(text: '123456');
  final loading = false.obs;

  void login() {
    Get.focusScope!.unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }

    var userLoginRequestModel = UserLoginRequestModel(
      email: emailController.text,
      password: passwordController.text,
    );

    loading(true);

    _authService.login(userLoginRequestModel).then((value) {
      Get.offNamed(Routes.dashboard);
    }, onError: (error) {
      Get.dialog(AlertDialog(
        title: Text(error.toString()),
      ));
    }).whenComplete(() => loading(false));
  }
}
