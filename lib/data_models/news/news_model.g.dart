// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      photoUrl: json['photoUrl'] as String,
      logoUrl: json['logoUrl'] as String,
      milesType: $enumDecode(_$MilesTypeEnumMap, json['milesType']),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'photoUrl': instance.photoUrl,
      'logoUrl': instance.logoUrl,
      'milesType': _$MilesTypeEnumMap[instance.milesType]!,
      'description': instance.description,
    };

const _$MilesTypeEnumMap = {
  MilesType.earn: 'Earn',
  MilesType.spend: 'Spend',
};
