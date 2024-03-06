import 'package:koinonia/features/biblereading-feature/domain/entity/VerseEntity.dart';

class VerseModel extends VerseEntity {
  final String book;
  final int chapter;
  final int verse;
  final String text;

  VerseModel({
    required this.book,
    required this.chapter,
    required this.verse,
    required this.text,
  }) : super(book: '', chapter: 0, verse: 0, text: '');

  factory VerseModel.fromJson(Map<String, dynamic> json) {
    return VerseModel(
      book: json['book'],
      chapter: json['chapter'],
      verse: json['verse'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'book': book,
      'chapter': chapter,
      'verse': verse,
      'text': text,
    };
  }
}
