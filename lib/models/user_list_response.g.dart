// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserListResponse _$$_UserListResponseFromJson(Map<String, dynamic> json) =>
    _$_UserListResponse(
      page: json['page'] as int,
      per_page: json['per_page'] as int,
      total: json['total'] as int,
      total_pages: json['total_pages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserListResponseToJson(_$_UserListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_pages': instance.total_pages,
      'data': instance.data,
    };
