import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class HomeCard extends StatelessWidget {
  final int temperature;
  final String weatherCode;
  final String windSpeed;
  final String humidity;

  const HomeCard({
    super.key,
    required this.temperature,
    required this.weatherCode,
    required this.windSpeed,
    required this.humidity,
  });

  String categorizeWeather(int weatherCode) {
    if (weatherCode == 1000) {
      return "Cerah";
    } else if (weatherCode == 1001) {
      return "Berawan Sebagian";
    } else if (weatherCode == 1100 ||
        weatherCode == 1101 ||
        weatherCode == 1102) {
      return "Berawan Sebagian";
    } else if (weatherCode == 2000 || weatherCode == 2100) {
      return "Berkabut";
    } else if (weatherCode == 4000 ||
        weatherCode == 4001 ||
        weatherCode == 4200 ||
        weatherCode == 4201) {
      return "Hujan";
    } else if (weatherCode == 5000 ||
        weatherCode == 5001 ||
        weatherCode == 5100 ||
        weatherCode == 5101) {
      return "Bersalju";
    } else if (weatherCode == 6000 ||
        weatherCode == 6001 ||
        weatherCode == 6200 ||
        weatherCode == 6201 ||
        weatherCode == 7000 ||
        weatherCode == 7101 ||
        weatherCode == 7102) {
      return "Hujan Es";
    } else if (weatherCode == 8000) {
      return "Badai Petir";
    } else {
      return "Tidak Diketahui";
    }
  }

  String formatDateTime(DateTime dateTime) {
    return "Today, ${dateTime.day} ${_getMonthName(dateTime.month)}";
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    int weatherCodeInt = int.tryParse(weatherCode) ?? 0;

    String condition = categorizeWeather(weatherCodeInt);

    DateTime now = DateTime.now();
    String formattedDate = formatDateTime(now);

    return Container(
      width: 353,
      height: 335,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
        color: Colors.white.withOpacity(0.30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            // 'Today, 12 September',
            formattedDate,
            style: GoogleFonts.overpass(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                temperature.toString(),
                style: GoogleFonts.overpass(
                    color: Colors.white,
                    fontSize: 100,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    shadows: [
                      Shadow(
                        offset: const Offset(-4, 8),
                        blurRadius: 50,
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ]),
              ),
              const Text(
                '°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 72,
                  fontFamily: 'Overpass',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              )
            ],
          ),
          Text(
            condition,
            style: GoogleFonts.overpass(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 0,
                shadows: [
                  Shadow(
                    offset: const Offset(-2, 3),
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ]),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 110,
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.wind,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Wind',
                          style: GoogleFonts.overpass(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 0,
                              shadows: [
                                Shadow(
                                  offset: const Offset(-2, 3),
                                  blurRadius: 8,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 23),
                  Text(
                    '|',
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        height: 0,
                        shadows: [
                          Shadow(
                            offset: const Offset(-2, 3),
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    width: 23,
                  ),
                  Text(
                    "$windSpeed km/h",
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
                        ]),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 110,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.water_drop_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Hum',
                          style: GoogleFonts.overpass(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 0,
                              shadows: [
                                Shadow(
                                  offset: const Offset(-2, 3),
                                  blurRadius: 8,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 23),
                  Text(
                    '|',
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        height: 0,
                        shadows: [
                          Shadow(
                            offset: const Offset(-2, 3),
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    width: 23,
                  ),
                  Text(
                    "$humidity %",
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
                        ]),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
