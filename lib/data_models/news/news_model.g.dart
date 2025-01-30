// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      photoUrl: json['photoUrl'] as String?,
      logoUrl: json['logoUrl'] as String?,
      milesType: json['milesType'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'photoUrl': instance.photoUrl,
      'logoUrl': instance.logoUrl,
      'milesType': instance.milesType,
      'title': instance.title,
      'description': instance.description,
    };
