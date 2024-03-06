import 'package:koinonia/features/biblereading-feature/data/model/VerseModel.dart';
import 'package:koinonia/features/biblereading-feature/domain/entity/PassageEntity.dart';

class PassageModel extends PassageEntity {
  PassageModel({
    required String chapters,
    required List<VerseModel> verses,
  }) : super(
          chapters: chapters,
          verses: verses,
        );

  factory PassageModel.fromJson(Map<String, dynamic> json) {
    return PassageModel(
      chapters: json['chapters'],
      verses: (json['verses'] as List)
          .map((verseJson) => VerseModel.fromJson(verseJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chapters': chapters,
      // Assuming VerseModel has a `toJson` that correctly formats it.
      'verses': verses.map((verse) => (verse as VerseModel).toJson()).toList(),
    };
  }
}
