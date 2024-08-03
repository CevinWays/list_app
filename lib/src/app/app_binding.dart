import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:list_app/src/app/network/network_interceptor.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(
      Dio(
        BaseOptions(
          baseUrl: 'https://jsonplaceholder.typicode.com',
          connectTimeout: const Duration(minutes: 1),
        ),
      )..interceptors.add(
          NetworkInterceptor(logIsAllowed: true),
        ),
      permanent: true,
    );
  }
  
}