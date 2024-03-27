import 'package:daily_weather/core/params/params.dart';
import 'package:daily_weather/core/services/network_info.dart';
import 'package:daily_weather/features/weather/data/datasource/weather_data_source.dart';
import 'package:daily_weather/features/weather/domain/daily_weather.dart';

class WeatherRepository {
  const WeatherRepository({
    required this.dataSource,
    required this.networkInfo,
  });

  final NetworkInfo networkInfo;
  final WeatherDataSource dataSource;

  Future<List<DailyWeather>> getWeather(WeatherParams weatherParams) async {
    final result = await dataSource.getWeather(
      weatherParams.latitude,
      weatherParams.longitude,
      weatherParams.dailyParams,
      weatherParams.pastDays,
      weatherParams.forecastDays,
    );

    return List<DailyWeather>.generate(
      result.daily.time.length,
      (index) => DailyWeather(
        time: result.daily.time[index],
        weatherCode: parseWMOCode(result.daily.weatherCode[index]),
        temperature2mMax: result.daily.temperature2mMax[index],
        temperature2mMin: result.daily.temperature2mMin[index],
        sunrise: result.daily.sunrise[index],
        sunset: result.daily.sunset[index],
      ),
    );
  }

  String parseWMOCode(int code) {
    final weatherDescriptions = {
      0: 'Clear sky',
      1: 'Mainly clear',
      2: 'Partly cloudy',
      3: 'Overcast',
      45: 'Fog and depositing rime fog',
      48: 'Fog and depositing rime fog',
      51: 'Drizzle: Light intensity',
      53: 'Drizzle: Moderate intensity',
      55: 'Drizzle: Dense intensity',
      56: 'Freezing Drizzle: Light intensity',
      57: 'Freezing Drizzle: Dense intensity',
      61: 'Rain: Slight intensity',
      63: 'Rain: Moderate intensity',
      65: 'Rain: Heavy intensity',
      66: 'Freezing Rain: Light intensity',
      67: 'Freezing Rain: Heavy intensity',
      71: 'Snow fall: Slight intensity',
      73: 'Snow fall: Moderate intensity',
      75: 'Snow fall: Heavy intensity',
      77: 'Snow grains',
      80: 'Rain showers: Slight intensity',
      81: 'Rain showers: Moderate intensity',
      82: 'Rain showers: Violent intensity',
      85: 'Snow showers: Slight intensity',
      86: 'Snow showers: Heavy intensity',
      95: 'Thunderstorm: Slight or moderate',
      96: 'Thunderstorm with slight hail',
      99: 'Thunderstorm with heavy hail',
    };

    return weatherDescriptions[code] ?? "Unknown weather code ($code)";
  }
}
