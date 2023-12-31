import 'package:first_task/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_response.freezed.dart';
part 'user_list_response.g.dart';

@freezed
class UserListResponse with _$UserListResponse{
  const factory UserListResponse({
    required int page,
    required int per_page,
    required int total,
    required int total_pages,
    required List<User> data,
  }) = _UserListResponse;

  factory UserListResponse.fromJson(Map<String,dynamic> json) => _$UserListResponseFromJson(json);
}