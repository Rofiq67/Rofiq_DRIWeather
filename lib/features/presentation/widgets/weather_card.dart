import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCard extends StatefulWidget {
  final int temperature;
  final String hour;
  final bool isCurrentTime;
  const WeatherCard(
      {super.key,
      required this.temperature,
      required this.hour,
      required this.isCurrentTime});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  final now = DateTime.now();
  final currentHour = DateTime.now.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
      decoration: ShapeDecoration(
        color: widget.isCurrentTime
            ? Colors.white.withOpacity(0.20)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: widget.isCurrentTime
              ? const BorderSide(width: 1, color: Colors.white)
              : BorderSide.none,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${widget.temperature}°C',
            style: GoogleFonts.overpass(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          Image.asset(
            'assets/images/cloudwhite.png',
            width: 50,
          ),
          Text(
            widget.hour.toString(),
            style: GoogleFonts.overpass(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
