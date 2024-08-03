import 'package:list_app/src/features/list/data/models/list_model.dart';
import 'package:list_app/src/features/list/domain/entities/list_entity.dart';

class ListMapper {
  static ListEntity toEntity(ListModel model) => ListEntity(
        title: model.title,
        body: model.body,
        userId: model.userId,
        id: model.id,
      );
}
