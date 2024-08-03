import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:list_app/src/features/list/domain/entities/list_entity.dart';
import 'package:list_app/src/features/list/domain/usecases/get_list.dart';

import '../../../../app/utils/data_wrapper.dart';

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

  Future<void> onGetList({String? id}) async {
    _list.value = DataWrapper.loading();

    await _getList.execute(GetListParam(id: id)).then(
        (value) => _list.value = DataWrapper.success(value),
        onError: (e) => _list.value = DataWrapper.error());
  }

  void onMatchIds({required String inputText}) async{
    if (inputText.isNotEmpty && _list.value.data != null) {
      var matchingIds = _list.value.data
          ?.where((item) =>
              (item.title?.toLowerCase() ?? '').contains(inputText.toLowerCase()))
          .map((item) => item.id as int)
          .toList();
      await onGetList(id: matchingIds?.firstOrNull.toString() ?? '0'); 
    }else{
      onGetList();
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
