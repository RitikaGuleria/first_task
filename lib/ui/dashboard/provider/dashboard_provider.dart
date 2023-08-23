import 'package:dio/dio.dart';
import 'package:first_task/repository/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

@riverpod
class DashboardProvider extends _$DashboardProvider{

  @override
  Future<List<User>> build() async {
    return [];
  }

// Add methods to mutate the state
  Future<List<User>> fetchUsers() async {
    state=const AsyncValue.loading();
    try{
      final dio = Dio();
      final response = await dio.get('https://reqres.in/api/users?page=2');
      final json = response.data['data']! as List;
      final userData = json.map((item) => User.fromJson(item)).toList();
      print(userData);
      state = AsyncData(userData);
      return userData;
    }catch(error,stackTrace){
      state=AsyncValue.error( error.toString(),stackTrace);
      return [];
    }
  }
}