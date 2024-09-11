import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  final VoidCallback onPress;
  final TextEditingController onController;
  const SearchWidget(
      {super.key, required this.onPress, required this.onController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 59),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: TextField(
              controller: onController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xff444E72),
                    size: 24,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: onPress,
                ),
                hintText: 'Search here',
                hintStyle: GoogleFonts.overpass(
                  color: const Color(0xFF828BA9),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
