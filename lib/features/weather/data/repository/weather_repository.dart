import 'package:daily_weather/core/params/params.dart';
import 'package:daily_weather/core/services/network_info.dart';
import 'package:daily_weather/features/weather/data/datasource/weather_data_source.dart';
import 'package:daily_weather/features/weather/data/model/weather_data_response.dart';

class WeatherRepository {
  const WeatherRepository({
    required this.dataSource,
    required this.networkInfo,
  });

  final NetworkInfo networkInfo;
  final WeatherDataSource dataSource;

  Future<WeatherDataResponse> getWeather(WeatherParams weatherParams) async {
    return dataSource.getWeather(
      weatherParams.latitude,
      weatherParams.longitude,
      weatherParams.dailyParams,
      weatherParams.pastDays,
      weatherParams.forecastDays,
    );
  }
}
