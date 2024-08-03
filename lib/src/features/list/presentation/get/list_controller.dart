import 'package:get/get.dart';
import 'package:list_app/src/features/list/domain/entities/list_entity.dart';
import 'package:list_app/src/features/list/domain/usecases/get_list.dart';

import '../../../../app/utils/data_wrapper.dart';
import '../../../../app/utils/usecase.dart';

class ListController extends GetxController {
  final GetList _getList;

  ListController({required GetList getList}) : _getList = getList;

  final _list = Rx<DataWrapper<List<ListEntity>>>(DataWrapper.init());

  DataWrapper<List<ListEntity>> get list => _list.value;

  @override
  void onInit() {
    onGetList();
    super.onInit();
  }

  void onGetList() async {
    _list.value = DataWrapper.loading();

    await _getList.execute(NoParams()).then(
        (value) => _list.value = DataWrapper.success(value),
        onError: (e) => _list.value = DataWrapper.error());
  }
}
