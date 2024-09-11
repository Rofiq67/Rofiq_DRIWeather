// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather_model.dart';

class WeatherController extends GetxController {
  final Rx<Weather> weather = Rx(const Weather(
    temperature: 0,
    condition: "",
    windSpeed: "0.0",
    humidity: "0.0",
  ));

  Future<void> fetchRealtime(String location) async {
    const String apiKey = "xP5Q8LxaXk73d5QKmEvc7Cn1LchVCh4Z";
    final Uri url = Uri.parse(
        "https://api.tomorrow.io/v4/weather/realtime?location=$location&apikey=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final weatherData = jsonDecode(response.body);
        print("Weather Data: $weatherData"); // Log the entire response
        updateWeather(weatherData);
      } else {
        print("Error fetching weather: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching weather: $error");
    }
  }

  void updateWeather(Map<String, dynamic> weatherData) {
    try {
      // Akses data "data" dan "values"
      final data = weatherData["data"];
      final values = data?["values"];

      // Periksa keberadaan "values"
      if (values != null) {
        // Ekstrak data cuaca
        final temperature = (values["temperature"]?.toDouble() ?? 0.0).round();
        final condition = values["weatherCode"]?.toString() ?? "N/a";
        final windSpeed = values["windSpeed"]?.toString() ?? "N/a";
        final humidity = values["humidity"]?.toString() ?? "N/a";

        weather.value = Weather(
          temperature: temperature,
          condition: condition,
          windSpeed: windSpeed,
          humidity: humidity,
        );
      } else {
        print("Error: Missing values data");
      }
    } catch (error) {
      print("Error updating weather data: $error");
    }
  }

  // (cuaca perjam)
  final RxList<HourlyWeather> hourlyWeather = RxList([]);

  Future<void> fetchHourly(String location) async {
    const String apiKey = "xP5Q8LxaXk73d5QKmEvc7Cn1LchVCh4Z";
    final Uri url = Uri.parse(
        "https://api.tomorrow.io/v4/weather/history/recent?location=$location&apikey=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final weatherData = jsonDecode(response.body);
        print("Hourly Weather Data: $weatherData");

        final timelines = weatherData["timelines"];
        if (timelines != null) {
          final hourly = timelines["hourly"];
          if (hourly != null) {
            final List<HourlyWeather> hourlyList = [];
            for (final interval in hourly) {
              final time = interval["time"]?.toString() ?? "";
              final values = interval["values"];
              if (values != null) {
                final temperature = values["temperature"]?.toInt() ?? 0;
                final condition = values["weatherCode"]?.toString() ?? "N/a";

                hourlyList.add(HourlyWeather(
                  time: time,
                  temperature: temperature,
                  condition: condition,
                ));
              } else {
                print("Error: Missing values field");
              }
            }
            hourlyWeather.value = hourlyList;
          } else {
            print("Error: Missing hourly data");
          }
        } else {
          print("Error: Missing timelines field");
        }
      } else {
        print("Error fetching hourly weather: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching hourly weather: $error");
    }
  }

  //daily

  final RxList<DailyForecast> dailyForecast = RxList([]);
  Future<void> fetchDaily(String location) async {
    const String apiKey = "xP5Q8LxaXk73d5QKmEvc7Cn1LchVCh4Z";
    final Uri url = Uri.parse(
        "https://api.tomorrow.io/v4/weather/history/recent?location=$location&timesteps=daily&apikey=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final weatherData = jsonDecode(response.body);
        print("Daily Weather Data: $weatherData");

        final timelines = weatherData["timelines"];
        if (timelines != null) {
          final daily = timelines["daily"];
          if (daily != null) {
            final List<DailyForecast> dailyList = [];
            for (final interval in daily) {
              final date = interval["time"]?.toString().substring(0, 10) ?? "";
              final values = interval["values"];
              if (values != null) {
                final temperature = values["temperature"]?.toString() ?? "N/a";
                final condition = values["weatherCode"]?.toString() ?? "N/a";

                dailyList.add(DailyForecast(
                  date: date,
                  temperature: temperature,
                  condition: condition,
                ));
              } else {
                print("Error: Missing values field");
              }
            }
            dailyForecast.value = dailyList;
          } else {
            print("Error: Missing daily data");
          }
        } else {
          print("Error: Missing timelines field");
        }
      } else {
        print("Error fetching daily weather: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching daily weather: $error");
    }
  }
}
