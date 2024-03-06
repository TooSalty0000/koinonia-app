import 'package:koinonia/core/resources/data_state.dart';
import 'package:koinonia/features/biblereading-feature/domain/entity/PassageEntity.dart';

abstract class PassageRepository {
  Future<DataState<PassageEntity>> getPassages(
      {required String book,
      required String chapter,
      required String start,
      required String end});
}
