import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String email,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    required String avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// @freezed
// class RequestState with _$RequestState {
//   const factory RequestState.loading() => Loading;
//   const factory RequestState.success(User user) => Success;
//   const factory RequestState.failure(String message) => Failure;
// }

// RequestState loading = RequestState.loading();
// RequestState success = RequestState.success(user);
// RequestState failure = RequestState.failure("Something went wrong");
//
// print(sucess.user.name);
