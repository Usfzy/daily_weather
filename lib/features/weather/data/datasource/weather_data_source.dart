import 'package:chopper/chopper.dart';
part 'weather_data_source.chopper.dart';

@ChopperApi()
abstract class WeatherDataSource extends ChopperService {
  static WeatherDataSource create([ChopperClient? client]) {
    return _$WeatherDataSource(client);
  }
}
