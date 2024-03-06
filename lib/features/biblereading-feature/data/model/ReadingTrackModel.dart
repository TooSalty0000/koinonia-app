import 'package:koinonia/features/biblereading-feature/domain/entity/ReadingTrackEntity.dart';

class ReadingTrackModel extends ReadingTrackEntity {
  const ReadingTrackModel({
    required String trackName,
    required int day,
    required String chapters,
  }) : super(trackName: trackName, day: day, chapters: chapters);

  // Factory constructor for creating an instance from a JSON map
  factory ReadingTrackModel.fromJson(Map<String, dynamic> json) {
    return ReadingTrackModel(
      trackName: json['track_name'] as String,
      day: json['day'] as int,
      chapters: json['chapters'] as String,
    );
  }

  // Method to convert the instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'track_name': trackName,
      'day': day,
      'chapters': chapters,
    };
  }
}
