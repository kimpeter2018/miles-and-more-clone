// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      points: (json['points'] as num).toInt(),
      gender: _genderFromJson(json['gender'] as String),
      firstName: json['firstName'] as String,
      surName: json['surName'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'points': instance.points,
      'gender': _genderToJson(instance.gender),
      'firstName': instance.firstName,
      'surName': instance.surName,
      'photoUrl': instance.photoUrl,
    };
