import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserAuthenticationRepository {
  final Dio client;
  UserAuthenticationRepository({required this.client});

  Future<String> loginUser(String email,String password) async{
    try{
      final response = await client.post("login",data: {"email":email,"password":password});
      if(response.statusCode==200){
        final jsonData = response.data as Map<String,dynamic>;
        final token = jsonData['token'] as String;
        print("login Token :$token");
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

  Future<String> registerUser(String email,String password) async{
    try{
      final response = await client.post("register",data: {"email":email,"password":password});
      if(response.statusCode==200){
        final jsonData = response.data as Map<String,dynamic>;
        final token = jsonData['token'] as String;
        print("Register Token :$token");
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