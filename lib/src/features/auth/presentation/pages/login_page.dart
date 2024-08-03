import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/src/features/auth/presentation/get/login_controller.dart';

import '../../../list/presentation/pages/list_page.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () async {
          final result = await controller.signInWithGoogle();
          if (result != null) {
            Get.offAllNamed(ListPage.routeName);
          }
        },
        child: const Text('Sign In'),
      )),
    );
  }
}
