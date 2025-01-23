import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class News with _$News {
  const factory News({
    required String? photoUrl,
    required String? logoUrl,
    required String milesType,
    required String description,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
