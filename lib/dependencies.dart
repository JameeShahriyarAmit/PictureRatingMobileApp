//! This file fully given. Do nothing on it except the IP address for the RestService.

import 'package:get_it/get_it.dart';

import 'services/rest_service.dart';
import 'services/photo_service.dart';

GetIt dependency = GetIt.instance;

void init() {
  dependency.registerLazySingleton<RestService>(
    () => RestService(
        baseUrl:
            'http://192.168.0.100:3000'), // Change the IP address according to your own computer IP address. Remain the port number to 3000
  );

  dependency.registerLazySingleton<PhotoService>(() => PhotoService());
}
