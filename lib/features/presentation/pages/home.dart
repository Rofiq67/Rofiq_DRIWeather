import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rekadigital_flutter/features/logic/controllers/weather_controller.dart';
import 'package:rekadigital_flutter/features/presentation/pages/search_loc.dart';
import 'package:rekadigital_flutter/features/presentation/pages/weather_details.dart';
import 'package:rekadigital_flutter/features/presentation/widgets/home_card.dart';
import 'package:rekadigital_flutter/features/presentation/widgets/notif_features.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final WeatherController weatherController = Get.put(WeatherController());

  RxString currentLocation = (Get.arguments?.toString() ?? "Semarang").obs;

  @override
  void initState() {
    super.initState();
    // weatherController.fetchWeather(currentLocation ?? "Semarang");
    weatherController.fetchRealtime(currentLocation.value);
  }

  void updateLocation(String newLocation) {
    // Update observable variable
    currentLocation.value = newLocation;
    weatherController.fetchRealtime(currentLocation.value);
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 31),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 52),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          final newLocation =
                              await Get.to(() => const SearchLoc());
                          if (newLocation != null) {
                            updateLocation(newLocation.toString());
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/map.svg'),
                            const SizedBox(width: 20),
                            Obx(() {
                              return Text(currentLocation.value,
                                  style: GoogleFonts.overpass(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    shadows: [
                                      Shadow(
                                        offset: const Offset(-2, 3),
                                        blurRadius: 8,
                                        color: Colors.black.withOpacity(0.25),
                                      ),
                                    ],
                                  ));
                            }),
                            const SizedBox(width: 17),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const NotifFeatures(),
                    ],
                  ),
                  const SizedBox(height: 45),
                  Center(
                    child: Image.asset(
                      'assets/images/cloudy_.png',
                      width: 230,
                    ),
                  ),
                  Obx(() {
                    final weather = weatherController.weather.value;
                    return HomeCard(
                      temperature: weather.temperature,
                      weatherCode: weather.condition,
                      windSpeed: weather.windSpeed,
                      humidity: weather.humidity,
                    );
                  }),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(220, 64),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadowColor: const Color(0x19000000),
                      elevation: 1,
                    ),
                    onPressed: () {
                      Get.to(() => const WeatherDetails());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Weather Details',
                          style: TextStyle(
                            color: Color(0xff444E72),
                            fontSize: 18,
                            fontFamily: 'Overpass',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 11),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14,
                          color: Color(0xff444E72),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
