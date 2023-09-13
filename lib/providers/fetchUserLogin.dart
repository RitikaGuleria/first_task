
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/user_authentication_repository_provider.dart';


part 'fetchUserLogin.g.dart';

@riverpod
class FetchUserLogin extends _$FetchUserLogin{

  @override
  Future<String> build() async {
      return '';
    }

  Future<AsyncValue<String>> fetchUserLogin(String email,String password) async{
    try{
      final userData = await ref.read(userAuthenticationRepositoryProvider).loginUser(email, password);
      return AsyncValue.data(userData);
    }on DioException catch(e){
      print("Error searching user response due to dio exception: $e");
      return AsyncValue.error("Error searching user response: $e", StackTrace.current);
    } catch(e){
      print("Error searching user response: $e");
      return AsyncValue.error("Error searching products: $e", StackTrace.current);
    }
  }

  Future<AsyncValue<String>> fetchUserRegister(String email,String password) async{
    try{
      final userData = await ref.read(userAuthenticationRepositoryProvider).registerUser(email, password);
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