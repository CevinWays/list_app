import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:list_app/src/features/list/data/datasources/list_datasource.dart';
import 'package:list_app/src/features/list/data/datasources/list_datasource_impl.dart';
import 'package:list_app/src/features/list/data/repositories/list_repository_impl.dart';
import 'package:list_app/src/features/list/domain/repositories/list_repository.dart';
import 'package:list_app/src/features/list/domain/usecases/get_list.dart';
import 'package:list_app/src/features/list/presentation/get/list_controller.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ListDatasource>(
      ListDatasourceImpl(
        client: Get.find<Dio>(),
      ),
    );

    Get.put<ListRepository>(
      ListRepositoryImpl(
        listDatasource: Get.find<ListDatasource>(),
      ),
    );

    Get.put(
      GetList(
        repository: Get.find<ListRepository>(),
      ),
    );
    Get.put(
      ListController(getList: Get.find<GetList>()),
    );
  }
  
}