import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rekadigital_flutter/features/logic/controllers/weather_controller.dart';
import 'package:rekadigital_flutter/features/presentation/widgets/recent_history.dart';
import 'package:rekadigital_flutter/features/presentation/widgets/search_widget.dart';

class SearchLoc extends StatefulWidget {
  const SearchLoc({super.key});

  @override
  State<SearchLoc> createState() => _SearchLocState();
}

class _SearchLocState extends State<SearchLoc> {
  final WeatherController weatherController = Get.put(WeatherController());
  final TextEditingController locationController = TextEditingController();
  final SearchHistoryManager _historyManager = SearchHistoryManager();
  List<String> searchHistory = [];

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
  }

  Future<void> _loadSearchHistory() async {
    searchHistory = await _historyManager.getSearchHistory();
    setState(() {});
  }

  void navigateToHome(String location) {
    if (location.isNotEmpty) {
      _historyManager.addSearchToHistory(location);
      Get.back(result: location);
      weatherController.fetchRealtime(location);
    }
  }

  void onSearchHistoryTap(String location) {
    setState(() {
      locationController.text = location;
    });
    navigateToHome(location);
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
            Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 260,
                    ),
                    Image.asset('assets/images/maps.png'),
                  ],
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    'Recent search',
                    style: GoogleFonts.overpass(
                      color: const Color(0xFF444D71),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: searchHistory.length,
                      itemBuilder: (context, index) {
                        final location = searchHistory[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            Icons.access_time,
                            color: Color(0xff444E72),
                            size: 24,
                          ),
                          title: Text(
                            location,
                            style: GoogleFonts.overpass(
                              color: const Color(0xFF444D71),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 0.08,
                            ),
                          ),
                          onTap: () => onSearchHistoryTap(location),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SearchWidget(
              onPress: () {
                navigateToHome(locationController.text);
              },
              onController: locationController,
            ),
          ],
        ),
      ),
    );
  }
}
