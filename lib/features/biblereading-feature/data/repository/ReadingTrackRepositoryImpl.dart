import 'package:koinonia/core/resources/supbase_data_state.dart';
import 'package:koinonia/features/biblereading-feature/data/model/ReadingTrackModel.dart';
import 'package:koinonia/features/biblereading-feature/domain/repository/ReadingTrackRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReadingTrackRepositoryImpl extends ReadingTrackRepository {
  @override
  Future<SBDataState<ReadingTrackModel>> getReadingTracks(
      {required String trackName, required int day}) async {
    try {
      final response = await Supabase.instance.client
          .from('ReadingTrack')
          .select('*')
          .eq('track_name', trackName)
          .eq('day', day)
          .single();

      final readingTrackModels = ReadingTrackModel.fromJson(response);
      return SBDataSuccess(data: readingTrackModels);
    } catch (e) {
      return SBDataError(error: e.toString());
    }
  }
}
