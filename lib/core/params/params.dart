// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherParams {
  final double latitude;
  final double longitude;
  final List<String> dailyParams;
  final int pastDays;
  final int forecastDays;

  WeatherParams({
    required this.latitude,
    required this.longitude,
    required this.dailyParams,
    required this.pastDays,
    required this.forecastDays,
  });
}
