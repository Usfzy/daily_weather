// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_source.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$WeatherDataSource extends WeatherDataSource {
  _$WeatherDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = WeatherDataSource;

  @override
  Future<WeatherDataResponse> getWeather(
    double latitude,
    double longitude,
    List<String> dailyParams,
    int pastDays,
    int forecastDays,
  ) async {
    final Uri $url = Uri.parse('/v1/forecast');
    final Map<String, dynamic> $params = <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'daily': dailyParams,
      'past_days': pastDays,
      'forecast_days': forecastDays,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    final Response $response =
        await client.send<WeatherDataResponse, WeatherDataResponse>($request);
    return $response.bodyOrThrow;
  }
}
