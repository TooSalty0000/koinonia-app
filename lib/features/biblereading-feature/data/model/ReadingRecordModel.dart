import 'package:koinonia/features/biblereading-feature/domain/entity/ReadingRecordEntity.dart';

class ReadingRecordModel extends ReadingRecordEntity {
  final DateTime startDate;
  final int progressDays;
  final DateTime lastReadDate;
  final String track;
  final String recordName;

  ReadingRecordModel(
      {required this.startDate,
      required this.progressDays,
      required this.lastReadDate,
      required this.track,
      required this.recordName})
      : super(
            startDate: startDate,
            progressDays: progressDays,
            lastReadDate: lastReadDate,
            track: track,
            recordName: recordName);

  factory ReadingRecordModel.fromJson(Map<String, dynamic> json) {
    return ReadingRecordModel(
      startDate: DateTime.parse(json['created_at'] as String),
      progressDays: json['progress_date'] as int,
      lastReadDate: DateTime.parse(json['last_day_to_read'] as String),
      track: json['track'] as String,
      recordName: json['record_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': startDate.toIso8601String(),
      'progress_date': progressDays,
      'last_day_to_read': lastReadDate.toIso8601String(),
      'track': track,
      'record_name': recordName,
    };
  }
}
