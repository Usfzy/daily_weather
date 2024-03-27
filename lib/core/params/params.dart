class WeatherParams {
  final double latitude;
  final double longitude;
  final String dailyParams;
  final int pastDays;
  final int forecastDays;

  WeatherParams({
    this.latitude = 40.89,
    this.longitude = -8.615,
    this.pastDays = 7,
    this.forecastDays = 3,
    this.dailyParams =
        'weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset',
  });
}
