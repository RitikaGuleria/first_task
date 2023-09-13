import 'package:first_task/di/dio_client.dart';
import 'package:first_task/repository/user_login_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_login_repository_provider.g.dart';

@riverpod
UserLoginRepository userLoginRepository(UserLoginRepositoryRef ref) => UserLoginRepository(
  client: ref.watch(dioProvider));