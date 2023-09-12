import 'package:dio/dio.dart';
import 'package:first_task/models/user_list_response.dart';
import 'package:riverpod/src/provider.dart';

class UserListRepository{
   final Dio client;
   UserListRepository({required this.client});

   Future<UserListResponse> getUserData() async{
      try{
         final response = await client.get("users?page=1");
         print("API RESPONSE- $response");
         if(response.statusCode == 200){
            final jsonData = response.data as Map<String,dynamic>;
            final result = UserListResponse.fromJson(jsonData);
            return result;
         }else{
            throw Exception("Failed to load data");
         }
      }
      catch(e)
      {
        print("catch block rethrow $e");
        rethrow;
      }
   }

   Future<String> loginUser(String email,String password) async{
      try{
        final response = await client.post("login",data: {"email":email,"password":password});
        if(response.statusCode==200){
           final jsonData = response.data as Map<String,dynamic>;
           final token = jsonData['token'] as String;
           print(token);
           return token;
        }else{
           throw Exception("Failed to load data");
        }
      }
      catch(e){
         print("catch block rethrow $e");
         rethrow;
      }
   }

}