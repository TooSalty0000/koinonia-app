import 'package:koinonia/core/resources/supbase_data_state.dart';
import 'package:koinonia/features/biblereading-feature/data/model/ReadingRecordModel.dart';
import 'package:koinonia/features/biblereading-feature/domain/repository/ReadingRecordRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReadingRecordRepositoryImpl implements ReadingRecordRepository {
  final SupabaseClient _client;

  ReadingRecordRepositoryImpl(this._client);

  @override
  Future<SBDataState<List<ReadingRecordModel>>> getReadingRecords({
    required User user,
  }) async {
    try {
      final response = await _client.from('ReadingTrack').select('*').eq(
          'user_uuid',
          user.id); // Assuming user.id is the user's unique identifier

      // map the response to a list of ReadingRecordModel
      final readingRecordModels =
          response.map((e) => ReadingRecordModel.fromJson(e)).toList();

      return SBDataSuccess(data: readingRecordModels);
    } catch (e) {
      return SBDataError(error: e.toString());
    }
  }
}
