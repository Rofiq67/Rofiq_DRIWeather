import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rekadigital_flutter/features/logic/models/weather_model.dart';

class DayForecast extends StatelessWidget {
  final List<DailyForecast> dailyForecast;

  const DayForecast({super.key, required this.dailyForecast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 312,
          child: RawScrollbar(
            thumbVisibility: true,
            radius: const Radius.circular(8),
            thickness: 5,
            thumbColor: Colors.white,
            trackColor: Colors.transparent,
            trackBorderColor: Colors.white,
            trackRadius: const Radius.circular(18),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: dailyForecast.length,
              itemBuilder: (context, index) {
                final forecast = dailyForecast[index];
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${forecast.date}',
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
                      Image.asset(
                        'assets/images/cloudy.png', // Ensure correct image names and paths
                        width: 55,
                      ),
                      Text(
                        '${forecast.temperature}°',
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
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.sunny,
              color: Colors.white,
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              'DRI Weather',
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
        )
      ],
    );
  }
}
