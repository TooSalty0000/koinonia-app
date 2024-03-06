import 'package:koinonia/core/resources/supbase_data_state.dart';
import 'package:koinonia/core/usecase/usecase.dart';
import 'package:koinonia/features/biblereading-feature/domain/entity/ReadingRecordEntity.dart';
import 'package:koinonia/features/biblereading-feature/domain/repository/ReadingRecordRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReadingRecordUseCase
    implements
        UseCase<SBDataState<List<ReadingRecordEntity>>,
            ReadingRecordUseCaseParams> {
  final ReadingRecordRepository _repository;

  ReadingRecordUseCase(this._repository);

  @override
  Future<SBDataState<List<ReadingRecordEntity>>> call(
      {required ReadingRecordUseCaseParams params}) async {
    return _repository.getReadingRecords(user: params.user);
  }
}

class ReadingRecordUseCaseParams {
  final User user;

  ReadingRecordUseCaseParams({required this.user});
}
