

import 'package:first_task/di/dio_client.dart';
import 'package:first_task/repository/user_list_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_list_repository_provider.g.dart';

@riverpod
UserListRepository userListRepository(UserListRepositoryRef ref) => UserListRepository(
    client: ref.watch(dioProvider));