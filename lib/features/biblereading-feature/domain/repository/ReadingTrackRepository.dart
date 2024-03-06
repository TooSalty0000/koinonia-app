import 'package:koinonia/core/resources/supbase_data_state.dart';
import 'package:koinonia/features/biblereading-feature/domain/entity/ReadingTrackEntity.dart';

abstract class ReadingTrackRepository {
  Future<SBDataState<ReadingTrackEntity>> getReadingTracks({
    required String trackName,
    required int day,
  });
}
