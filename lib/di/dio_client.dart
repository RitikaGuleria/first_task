
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((ref){
  final dio=Dio();
  dio.options.baseUrl = "https://reqres.in/api/";
  dio.interceptors.add(PrettyDioLogger());
  return dio;
});