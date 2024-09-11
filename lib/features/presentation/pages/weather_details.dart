import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rekadigital_flutter/features/logic/controllers/weather_controller.dart';
import 'package:rekadigital_flutter/features/presentation/widgets/day_forecast.dart';
import 'package:rekadigital_flutter/features/presentation/widgets/weather_card.dart';

class WeatherDetails extends StatefulWidget {
  const WeatherDetails({super.key});

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  final WeatherController weatherController = Get.find();
  late String currentHour;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    currentHour = getCurrentHour();
    formattedDate = formatDateTime(DateTime.now());
    final location = Get.arguments as String? ?? "Semarang";
    weatherController.fetchHourly(location);
  }

  String getCurrentHour() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  String formatDateTime(DateTime dateTime) {
    return "${_getMonthName(dateTime.month)}, ${dateTime.day} ";
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff47BFDF), Color(0xff4A91FF)])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              SvgPicture.asset('assets/svg/line_home.svg'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Back',
                            style: GoogleFonts.overpass(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              height: 0,
                              shadows: [
                                Shadow(
                                  offset: const Offset(-2, 3),
                                  blurRadius: 8,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 49),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today',
                          style: GoogleFonts.overpass(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            height: 0,
                            shadows: [
                              Shadow(
                                offset: const Offset(-2, 3),
                                blurRadius: 8,
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          formattedDate,
                          style: GoogleFonts.overpass(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            shadows: [
                              Shadow(
                                offset: const Offset(-2, 3),
                                blurRadius: 8,
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Obx(() {
                      final hourlyWeather = weatherController.hourlyWeather;
                      return SizedBox(
                        height: 150, // Adjust height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hourlyWeather.length,
                          itemBuilder: (context, index) {
                            final weather = hourlyWeather[index];
                            final isCurrent =
                                weather.time.substring(11, 16) == currentHour;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: WeatherCard(
                                temperature: weather.temperature,
                                hour: weather.time.substring(11, 16),
                                isCurrentTime: isCurrent,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next Forecast',
                          style: GoogleFonts.overpass(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              height: 0,
                              shadows: [
                                Shadow(
                                  offset: const Offset(-2, 3),
                                  blurRadius: 8,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ]),
                        ),
                        const Icon(
                          Icons.date_range_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() {
                      final dailyForecast = weatherController.dailyForecast;
                      return DayForecast(dailyForecast: dailyForecast);
                    }),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
