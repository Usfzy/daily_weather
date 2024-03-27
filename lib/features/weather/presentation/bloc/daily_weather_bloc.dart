import 'package:daily_weather/core/params/params.dart';
import 'package:daily_weather/features/weather/data/repository/weather_repository.dart';
import 'package:daily_weather/features/weather/domain/daily_weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_weather_event.dart';
part 'daily_weather_state.dart';
part 'daily_weather_bloc.freezed.dart';

class DailyWeatherBloc extends Bloc<DailyWeatherEvent, DailyWeatherState> {
  final WeatherRepository weatherRepository;

  DailyWeatherBloc({required this.weatherRepository})
      : super(const _Loading()) {
    on<DailyWeatherEvent>((event, emit) async {
      await event.when(
        getDailyWeather: () => getDailyWeather(emit),
      );
    });
  }

  Future<void> getDailyWeather(Emitter<DailyWeatherState> emit) async {
    try {
      emit(const DailyWeatherState.loading());
      final result = await weatherRepository.getWeather(
        WeatherParams(),
      );
      emit(DailyWeatherState.loaded(result));
    } catch (e) {
      emit(const DailyWeatherState.error("Error getting data"));
    }
  }
}
