import 'package:list_app/src/app/utils/error_handler.dart';
import 'package:list_app/src/app/utils/usecase.dart';
import 'package:list_app/src/features/list/domain/entities/list_entity.dart';
import 'package:list_app/src/features/list/domain/repositories/list_repository.dart';

class GetList extends UseCase<List<ListEntity>, GetListParam> {
  final ListRepository _repository;

  GetList({required ListRepository repository}) : _repository = repository;

  @override
  Future<List<ListEntity>> build(GetListParam params) {
    return _repository.getList(id: params.id);
  }

  @override
  ErrorHandler errorHandler() {
    throw UnimplementedError();
  }
  
}

class GetListParam {
  final String? id;

  GetListParam({this.id});
}