import 'package:dio/dio.dart';
import 'package:list_app/src/features/list/data/datasources/list_datasource.dart';
import 'package:list_app/src/features/list/data/models/list_model.dart';

class ListDatasourceImpl implements ListDatasource {
  final Dio client;

  ListDatasourceImpl({required this.client});

  @override
  Future<List<ListModel>> getList({String? id}) async {
    final endpoint = id == null ? '/posts' : '/posts/$id';
    final response = await client.get(endpoint);

    if(response.data is List){
      return List<ListModel>.from(
          response.data.map((data) => ListModel.fromJson(data))).toList();
    }else{
      final data = ListModel.fromJson(response.data);
      return [data];
    }
  }
}
