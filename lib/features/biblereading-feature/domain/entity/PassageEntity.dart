import 'package:equatable/equatable.dart';
import 'package:koinonia/features/biblereading-feature/domain/entity/VerseEntity.dart';

class PassageEntity extends Equatable {
  final String chapters;
  final List<VerseEntity> verses;

  PassageEntity({
    required this.chapters,
    required this.verses,
  });

  @override
  List<Object?> get props => [chapters, verses];
}
