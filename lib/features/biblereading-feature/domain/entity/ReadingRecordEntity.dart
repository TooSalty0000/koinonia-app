import 'package:equatable/equatable.dart';

class ReadingRecordEntity extends Equatable {
  final DateTime startDate;
  final int progressDays;
  final DateTime lastReadDate;
  final String track;
  final String recordName;

  ReadingRecordEntity({
    required this.startDate,
    required this.progressDays,
    required this.lastReadDate,
    required this.track,
    required this.recordName,
  });

  @override
  List<Object?> get props => [startDate, progressDays, lastReadDate, track];
}
