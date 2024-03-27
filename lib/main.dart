import 'package:daily_weather/config/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daily_weather/features/weather/presentation/bloc/daily_weather_bloc.dart';
import 'package:daily_weather/features/weather/presentation/screens/home_screen.dart';
import 'package:daily_weather/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();

  runApp(
    const WeatherApp(),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DailyWeatherBloc(
        weatherRepository: serviceLocator(),
      ),
      child: MaterialApp(
        title: 'Daily Weather',
        theme: theme,
        home: const HomeScreen(),
      ),
    );
  }
}

Future<void> _init() async {
  await initServiceLocator();
  _setupLogging();
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
