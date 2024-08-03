import 'package:dio/dio.dart';
import 'package:list_app/src/features/list/data/datasources/list_datasource.dart';
import 'package:list_app/src/features/list/data/models/list_model.dart';

class ListDatasourceImpl implements ListDatasource {
  final Dio client;

  ListDatasourceImpl({required this.client});

  @override
  Future<List<ListModel>> getList() async {
    final response = await client.get('/posts');

    return List<ListModel>.from(
        response.data.map((data) => ListModel.fromJson(data))).toList();
  }
}
