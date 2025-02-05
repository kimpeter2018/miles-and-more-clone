// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointHistoryModelImpl _$$PointHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PointHistoryModelImpl(
      points: (json['points'] as num).toInt(),
      provider: json['provider'] as String,
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      detail: json['detail'] as String,
    );

Map<String, dynamic> _$$PointHistoryModelImplToJson(
        _$PointHistoryModelImpl instance) =>
    <String, dynamic>{
      'points': instance.points,
      'provider': instance.provider,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'title': instance.title,
      'detail': instance.detail,
    };
