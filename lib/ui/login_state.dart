import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState
{
  LoginState({this.passwordVisible=false,this.isLoading=false});

  final bool passwordVisible;
  final bool isLoading;

  LoginState copyWith({bool? passwordVisible, bool? isLoading})
  {
      return LoginState(
        passwordVisible: passwordVisible ?? this.passwordVisible,
        isLoading: isLoading ?? this.isLoading
      );
  }
}

class LoginStateNotifier extends StateNotifier<LoginState>{

  LoginStateNotifier() : super(LoginState());

  void togglePasswordVisibility(){
    state= state.copyWith(passwordVisible: !state.passwordVisible);
  }

  void setLoading(bool isLoading){
    state=state.copyWith(isLoading: isLoading);
  }
}

final loginStateNotifierProvider = StateNotifierProvider<LoginStateNotifier,LoginState>((ref) => LoginStateNotifier(),);