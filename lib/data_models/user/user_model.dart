import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
    required int miles,
    required int qualifyingPoints,
    required int points,
    required Gender gender,
    required String firstName,
    required String surName,
    String? photoUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

enum Gender {
  @JsonValue('mr')
  mr,
  @JsonValue('ms')
  ms,
}

extension GenderExtension on Gender {
  String get value {
    switch (this) {
      case Gender.mr:
        return 'mr';
      case Gender.ms:
        return 'ms';
    }
  }
}
