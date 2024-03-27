class WeatherDataResponse {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final DailyUnits dailyUnits; // Make dailyUnits nullable
  final Daily daily; // Make daily nullable

  WeatherDataResponse({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeatherDataResponse.fromJson(Map<String, dynamic> json) =>
      WeatherDataResponse(
        latitude: json["latitude"],
        longitude: json["longitude"],
        generationtimeMs: json["generationtime_ms"],
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        dailyUnits: DailyUnits.fromJson(json["daily_units"]),
        daily: Daily.fromJson(json["daily"]),
      );
}

class DailyUnits {
  final String time;
  final String weatherCode;
  final String temperature2mMax;
  final String temperature2mMin;
  final String sunrise;
  final String sunset;

  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.sunrise,
    required this.sunset,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"] ?? '',
        weatherCode: json["weather_code"] ?? '',
        temperature2mMax: json["temperature_2m_max"] ?? '',
        temperature2mMin: json["temperature2m_min"] ?? '',
        sunrise: json["sunrise"] ?? '',
        sunset: json["sunset"] ?? '',
      );
}

class Daily {
  final List<String> time;
  final List<int> weatherCode;
  final List<double> temperature2mMax;
  final List<double> temperature2mMin;
  final List<DateTime> sunrise;
  final List<DateTime> sunset;

  Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.sunrise,
    required this.sunset,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List.from(json["time"] ?? []),
        weatherCode: List.from(json["weather_code"] ?? []),
        temperature2mMax: List.from(json["temperature_2m_max"] ?? []),
        temperature2mMin: List.from(json["temperature_2m_min"] ?? []),
        sunrise:
            List<DateTime>.from(json["sunrise"].map((x) => DateTime.parse(x))),
        sunset:
            List<DateTime>.from(json["sunset"].map((x) => DateTime.parse(x))),
      );
}
