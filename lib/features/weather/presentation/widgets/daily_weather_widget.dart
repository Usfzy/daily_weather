import 'package:daily_weather/core/constants/constants.dart';
import 'package:daily_weather/core/utils/colors.dart';
import 'package:daily_weather/core/utils/extensions.dart';
import 'package:daily_weather/core/widgets/spacers.dart';
import 'package:daily_weather/features/weather/domain/daily_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class DailyWeatherWidget extends StatelessWidget {
  final DailyWeather weather;

  const DailyWeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 14.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircularContainer(
                          path:
                              '${ImageConstants.kBaseSvgsPath}/${weather.weatherCategory}.svg',
                        ),
                        hSpace(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weather.weatherCode,
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Uv3',
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              vSpace(),
                              TemperatureItem(
                                icon: ImageConstants.kTemperatureHigh,
                                text: "High",
                                temperature: weather.temperature2mMax,
                              ),
                              vSpace(4),
                              TemperatureItem(
                                icon: ImageConstants.kTemperatureHigh,
                                text: "Low",
                                temperature: weather.temperature2mMin,
                              ),
                              vSpace(4),
                              TemperatureItem(
                                icon: ImageConstants.kSun,
                                text: "Sunrise",
                                time: weather.sunrise,
                              ),
                              vSpace(4),
                              TemperatureItem(
                                icon: ImageConstants.kMoon,
                                text: "Sunset",
                                time: weather.sunset,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                ImageConstants.kForwardRight,
                width: 16,
                height: 16,
              )
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Text(weather.time),
        ),
      ],
    );
  }
}

class CircularContainer extends StatelessWidget {
  final String path;

  const CircularContainer({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: kGreyLightColor,
      ),
      padding: const EdgeInsets.all(8),
      child: SvgPicture.asset(width: 24, height: 24, path),
    );
  }
}

class TemperatureItem extends StatelessWidget {
  final String icon;
  final String text;
  final String? time;
  final double? temperature;

  const TemperatureItem({
    super.key,
    required this.icon,
    required this.text,
    this.time,
    this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 24, height: 24),
        hSpace(),
        Text(
          text,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        if (temperature != null) ...[
          hSpace(16),
          Text(
            '$temperature°',
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        if (time != null)
          Text(
            '$time',
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        const Spacer(),
      ],
    );
  }
}
