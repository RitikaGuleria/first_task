import 'package:first_task/di/dio_client.dart';
import 'package:first_task/repository/user_authentication_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_authentication_repository_provider.g.dart';

@riverpod
UserAuthenticationRepository userAuthenticationRepository(UserAuthenticationRepositoryRef ref) => UserAuthenticationRepository(
  client: ref.watch(dioProvider));