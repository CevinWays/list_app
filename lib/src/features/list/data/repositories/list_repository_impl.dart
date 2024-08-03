import 'package:list_app/src/features/list/data/datasources/list_datasource.dart';
import 'package:list_app/src/features/list/domain/entities/list_entity.dart';

import '../../domain/repositories/list_repository.dart';
import '../mappers/list_mapper.dart';

class ListRepositoryImpl implements ListRepository {
  final ListDatasource listDatasource;

  ListRepositoryImpl({required this.listDatasource});
  @override
  Future<List<ListEntity>> getList() async {
    final model = await listDatasource.getList();

    return List<ListEntity>.from(model.map((data) => ListMapper.toEntity(data)))
        .toList();
  }
}
