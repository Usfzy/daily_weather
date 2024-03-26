import 'package:daily_weather/features/weather/data/datasource/weather_data_source.dart';

class WeatherRepository {
  const WeatherRepository({required this.dataSource});
  final WeatherDataSource dataSource;

  Future<void> getWeather() async{
    
  }
}
