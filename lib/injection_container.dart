import 'package:daily_weather/core/services/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  //* Core
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: serviceLocator(),
    ),
  );

  //* External dependenciesss
  serviceLocator.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
}
