import 'package:chopper/chopper.dart';
import 'package:daily_weather/features/weather/data/model/weather_data_response.dart';
part 'weather_data_source.chopper.dart';

@ChopperApi()
abstract class WeatherDataSource extends ChopperService {
  static WeatherDataSource create([ChopperClient? client]) {
    return _$WeatherDataSource(client);
  }

  @Get(path: '/v1/forecast')
  Future<WeatherDataResponse> getWeather(
    @Query("latitude") double latitude,
    @Query("longitude") double longitude,
    @Query("daily") List<String> dailyParams,
    @Query("past_days") int pastDays,
    @Query("forecast_days") int forecastDays,
  );
}
