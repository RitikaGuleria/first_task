import 'package:dio/dio.dart';

class UserLoginRepository {
  final Dio client;
  UserLoginRepository({required this.client});

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