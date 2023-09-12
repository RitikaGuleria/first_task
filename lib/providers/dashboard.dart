import 'package:dio/dio.dart';
import 'package:first_task/models/user.dart';
import 'package:first_task/models/user_list_response.dart';
import 'package:first_task/repository/user_list_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard.g.dart';

@riverpod
class Dashboard extends _$Dashboard{

  // @override
  // Future<List<User>> build() async {
  //   return [];
  // }

// Add methods to mutate the state
//   Future<List<User>> fetchUsers() async {
//     state=const AsyncValue.loading();
//     try{
//       final dio = Dio();
//       final response = await dio.get('https://reqres.in/api/users?page=2');
//       final json = response.data['data']! as List;
//       final userData = json.map((item) => User.fromJson(item)).toList();
//       print(userData);
//       state = AsyncData(userData);
//       return userData;
//     }catch(error,stackTrace){
//       state=AsyncValue.error( error.toString(),stackTrace);
//       return [];
//     }
//   }
//
//   Future<String> fetchUserLogin(String email,String password) async
//   {
//     try{
//       final dio = Dio();
//       final response = await dio.post("https://reqres.in/api/login",
//           data: {"email":email,"password":password});
//       if(response.statusCode == 200){
//         final jsonData = response.data;
//         final token = jsonData['token'] as String;
//         print(token);
//         return token;
//       }else{
//         throw Exception('Failed to load data');
//       }
//     }
//     catch(e){
//       print("catch block re-throw $e");
//       rethrow;
//     }
//   }

    @override
    Future<UserListResponse?> build() async{
        return null;
    }

    Future<void> fetchUserDetails() async{
      try{
        final userData = await ref.read(userListRepositoryProvider).getUserData();
        state = AsyncValue.data(userData);
      }on DioException catch(e){
        print("Error searching user response due to dio exception: $e");
        state = AsyncValue.error("Error searching user response: $e", StackTrace.current);
      } catch(e){
        print("Error searching user response: $e");
        state = AsyncValue.error("Error searching products: $e", StackTrace.current);
      }
    }

    Future<AsyncValue<String>> fetchUserLogin(String email,String password) async{
      try{
        final userData = await ref.read(userListRepositoryProvider).loginUser(email, password);
        return AsyncValue.data(userData);
      }on DioException catch(e){
        print("Error searching user response due to dio exception: $e");
        return AsyncValue.error("Error searching user response: $e", StackTrace.current);
      } catch(e){
        print("Error searching user response: $e");
        return AsyncValue.error("Error searching products: $e", StackTrace.current);
      }
    }
}