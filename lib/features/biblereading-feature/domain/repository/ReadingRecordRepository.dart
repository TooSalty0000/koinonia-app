import 'package:koinonia/core/resources/supbase_data_state.dart';
import 'package:koinonia/features/biblereading-feature/domain/entity/ReadingRecordEntity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ReadingRecordRepository {
  Future<SBDataState<List<ReadingRecordEntity>>> getReadingRecords({
    required User user,
  });
}
