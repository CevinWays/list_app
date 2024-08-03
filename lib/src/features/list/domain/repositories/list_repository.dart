import 'package:list_app/src/features/list/domain/entities/list_entity.dart';

abstract class ListRepository {
  Future<List<ListEntity>> getList({String? id});
}