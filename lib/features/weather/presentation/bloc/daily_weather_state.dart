part of 'daily_weather_bloc.dart';

@freezed
class DailyWeatherState with _$DailyWeatherState {
  const factory DailyWeatherState.loading() = _Loading;
  const factory DailyWeatherState.loaded(WeatherDataResponse weatherDataResponse) = _Loaded;
  const factory DailyWeatherState.error(String error) = _Error;
}
