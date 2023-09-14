// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserListResponse _$UserListResponseFromJson(Map<String, dynamic> json) {
  return _UserListResponse.fromJson(json);
}

/// @nodoc
mixin _$UserListResponse {
  int get page => throw _privateConstructorUsedError;
  int get per_page => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get total_pages => throw _privateConstructorUsedError;
  List<User> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserListResponseCopyWith<UserListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListResponseCopyWith<$Res> {
  factory $UserListResponseCopyWith(
          UserListResponse value, $Res Function(UserListResponse) then) =
      _$UserListResponseCopyWithImpl<$Res, UserListResponse>;
  @useResult
  $Res call(
      {int page, int per_page, int total, int total_pages, List<User> data});
}

/// @nodoc
class _$UserListResponseCopyWithImpl<$Res, $Val extends UserListResponse>
    implements $UserListResponseCopyWith<$Res> {
  _$UserListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? per_page = null,
    Object? total = null,
    Object? total_pages = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      total_pages: null == total_pages
          ? _value.total_pages
          : total_pages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserListResponseCopyWith<$Res>
    implements $UserListResponseCopyWith<$Res> {
  factory _$$_UserListResponseCopyWith(
          _$_UserListResponse value, $Res Function(_$_UserListResponse) then) =
      __$$_UserListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page, int per_page, int total, int total_pages, List<User> data});
}

/// @nodoc
class __$$_UserListResponseCopyWithImpl<$Res>
    extends _$UserListResponseCopyWithImpl<$Res, _$_UserListResponse>
    implements _$$_UserListResponseCopyWith<$Res> {
  __$$_UserListResponseCopyWithImpl(
      _$_UserListResponse _value, $Res Function(_$_UserListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? per_page = null,
    Object? total = null,
    Object? total_pages = null,
    Object? data = null,
  }) {
    return _then(_$_UserListResponse(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      total_pages: null == total_pages
          ? _value.total_pages
          : total_pages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserListResponse implements _UserListResponse {
  const _$_UserListResponse(
      {required this.page,
      required this.per_page,
      required this.total,
      required this.total_pages,
      required final List<User> data})
      : _data = data;

  factory _$_UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserListResponseFromJson(json);

  @override
  final int page;
  @override
  final int per_page;
  @override
  final int total;
  @override
  final int total_pages;
  final List<User> _data;
  @override
  List<User> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'UserListResponse(page: $page, per_page: $per_page, total: $total, total_pages: $total_pages, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserListResponse &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.per_page, per_page) ||
                other.per_page == per_page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.total_pages, total_pages) ||
                other.total_pages == total_pages) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, per_page, total,
      total_pages, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserListResponseCopyWith<_$_UserListResponse> get copyWith =>
      __$$_UserListResponseCopyWithImpl<_$_UserListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserListResponseToJson(
      this,
    );
  }
}

abstract class _UserListResponse implements UserListResponse {
  const factory _UserListResponse(
      {required final int page,
      required final int per_page,
      required final int total,
      required final int total_pages,
      required final List<User> data}) = _$_UserListResponse;

  factory _UserListResponse.fromJson(Map<String, dynamic> json) =
      _$_UserListResponse.fromJson;

  @override
  int get page;
  @override
  int get per_page;
  @override
  int get total;
  @override
  int get total_pages;
  @override
  List<User> get data;
  @override
  @JsonKey(ignore: true)
  _$$_UserListResponseCopyWith<_$_UserListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
