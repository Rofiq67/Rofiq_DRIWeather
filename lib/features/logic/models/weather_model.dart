class Weather {
  final int temperature;
  final String condition;
  final String windSpeed;
  final String humidity;

  const Weather({
    required this.temperature,
    required this.condition,
    required this.windSpeed,
    required this.humidity,
  });
}

class DailyForecast {
  final String date;
  final String temperature;
  final String condition;

  DailyForecast(
      {required this.date, required this.temperature, required this.condition});
}

class HourlyWeather {
  final String time;
  final int temperature;
  final String condition;

  HourlyWeather(
      {required this.time, required this.temperature, required this.condition});
}
