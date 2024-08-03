import 'package:get/get.dart';
import 'package:list_app/src/features/list/domain/entities/list_entity.dart';

import '../../../../app/utils/data_wrapper.dart';

class DetailListController extends GetxController {
  final _arguments =
      Rx<DataWrapper<ListEntity>>(DataWrapper.init());

  DataWrapper<ListEntity> get arguments => _arguments.value;

  @override
  void onInit() {
    super.onInit();
    onRetrieveArgument();
  }

  void onRetrieveArgument() {
    var args = Get.arguments;
    if (args is ListEntity) {
      _arguments.value = DataWrapper.success(args);
    }
  }
}