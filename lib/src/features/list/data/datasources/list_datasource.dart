import 'package:list_app/src/features/list/data/models/list_model.dart';

abstract class ListDatasource {
  Future<List<ListModel>> getList({String? id});
}
