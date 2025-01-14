import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum Gender { mr, ms }

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
    required int points,
    @JsonKey(fromJson: _genderFromJson, toJson: _genderToJson)
    required Gender gender,
    required String firstName,
    required String surName,
    String? photoUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

String _genderToJson(Gender gender) => gender.toString().split('.').last;

Gender _genderFromJson(String gender) =>
    Gender.values.firstWhere((e) => e.toString().split('.').last == gender);
