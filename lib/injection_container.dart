import 'package:daily_weather/core/services/chopper_service.dart';
import 'package:daily_weather/core/services/network_info.dart';
import 'package:daily_weather/features/weather/data/datasource/weather_data_source.dart';
import 'package:daily_weather/features/weather/data/repository/weather_repository.dart';
import 'package:daily_weather/features/weather/presentation/bloc/daily_weather_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
//* Blocs *******************************************************************************
  serviceLocator.registerFactory(
    () => DailyWeatherBloc(
      weatherRepository: serviceLocator(),
    ),
  );

//* Repositories *************************************************************************
  serviceLocator.registerLazySingleton(
    () => WeatherRepository(
      dataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

//* Core *********************************************************************************
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: serviceLocator(),
    ),
  );

//* External dependenciesss ***************************************************************
  serviceLocator.registerLazySingleton(
    () => WeatherDataSource.create(chopperClient),
  );

  serviceLocator.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
}
