// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      miles: (json['miles'] as num).toInt(),
      qualifyingPoints: (json['qualifyingPoints'] as num).toInt(),
      points: (json['points'] as num).toInt(),
      serviceCardNumber: json['serviceCardNumber'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      firstName: json['firstName'] as String,
      surName: json['surName'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'miles': instance.miles,
      'qualifyingPoints': instance.qualifyingPoints,
      'points': instance.points,
      'serviceCardNumber': instance.serviceCardNumber,
      'gender': _$GenderEnumMap[instance.gender]!,
      'firstName': instance.firstName,
      'surName': instance.surName,
      'photoUrl': instance.photoUrl,
    };

const _$GenderEnumMap = {
  Gender.mr: 'mr',
  Gender.ms: 'ms',
};
