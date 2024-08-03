import 'package:get/get.dart';
import 'package:list_app/src/features/auth/presentation/get/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
  
}