import 'package:daily_weather/core/widgets/custom_divider.dart';
import 'package:daily_weather/core/widgets/custom_error_widget.dart';
import 'package:daily_weather/core/widgets/custom_progress_indicator.dart';
import 'package:daily_weather/features/weather/domain/daily_weather.dart';
import 'package:daily_weather/features/weather/presentation/bloc/daily_weather_bloc.dart';
import 'package:daily_weather/features/weather/presentation/widgets/daily_weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    _loadDailyWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Daily Weather"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _loadDailyWeatherData();
        },
        child: BlocBuilder<DailyWeatherBloc, DailyWeatherState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CustomProgressIndicator()),
              loaded: (List<DailyWeather> dailyWeathers) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const CustomDivider(),
                  itemCount: dailyWeathers.length,
                  itemBuilder: (context, index) {
                    return DailyWeatherWidget(weather: dailyWeathers[index]);
                  },
                );
              },
              error: (error) => CustomErrorWidget(
                error: error,
                onRefresh: _loadDailyWeatherData,
              ),
            );
          },
        ),
      ),
    );
  }

  void _loadDailyWeatherData() {
    context.read<DailyWeatherBloc>().add(
          const DailyWeatherEvent.getDailyWeather(),
        );
  }
}
