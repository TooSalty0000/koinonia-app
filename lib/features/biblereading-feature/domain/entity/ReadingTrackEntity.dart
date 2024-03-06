import 'package:equatable/equatable.dart';

class ReadingTrackEntity extends Equatable {
  final String trackName;
  final int day;
  final String chapters;

  const ReadingTrackEntity({
    required this.trackName,
    required this.day,
    required this.chapters,
  });

  @override
  List<Object?> get props => [trackName, day, chapters];
}
