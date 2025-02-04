import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_history_model.freezed.dart';
part 'points_history_model.g.dart';

@freezed
class PointHistoryModel with _$PointHistoryModel {
  factory PointHistoryModel({
    required int points,
    required String provider,
    required String type,
    required DateTime date,
    required String title,
    required String detail,
  }) = _PointHistoryModel;

  factory PointHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PointHistoryModelFromJson(json);
}
