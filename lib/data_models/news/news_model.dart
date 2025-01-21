import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class News with _$News {
  const factory News({
    required String photoUrl,
    required String logoUrl,
    required MilesType milesType,
    required String description,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

enum MilesType {
  @JsonValue('Earn')
  earn,
  @JsonValue('Spend')
  spend,
}

extension MilesTypeExtension on MilesType {
  String get value {
    switch (this) {
      case MilesType.earn:
        return 'Earn';
      case MilesType.spend:
        return 'Spend';
    }
  }
}
