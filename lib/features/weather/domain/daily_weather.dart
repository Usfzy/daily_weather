class DailyWeather {
  final String time;
  final String weatherCode;
  final String weatherCategory;
  final double temperature2mMax;
  final double temperature2mMin;
  final String sunrise;
  final String sunset;

  const DailyWeather({
    required this.time,
    required this.weatherCode,
    required this.weatherCategory,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.sunrise,
    required this.sunset,
  });

  @override
  bool operator ==(covariant DailyWeather other) {
    if (identical(this, other)) return true;

    return other.time == time &&
        other.weatherCode == weatherCode &&
        other.weatherCategory == weatherCategory &&
        other.temperature2mMax == temperature2mMax &&
        other.temperature2mMin == temperature2mMin &&
        other.sunrise == sunrise &&
        other.sunset == sunset;
  }

  @override
  int get hashCode {
    return time.hashCode ^
        weatherCode.hashCode ^
        weatherCategory.hashCode ^
        temperature2mMax.hashCode ^
        temperature2mMin.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode;
  }
}
