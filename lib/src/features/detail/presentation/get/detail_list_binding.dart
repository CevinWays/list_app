import 'package:get/get.dart';
import 'package:list_app/src/features/detail/presentation/get/detail_list_controller.dart';

class DetailListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      DetailListController(),
    );
  }
}
