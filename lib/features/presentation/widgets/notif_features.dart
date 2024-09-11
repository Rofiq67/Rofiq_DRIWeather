import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rekadigital_flutter/features/presentation/widgets/notif_card.dart';

class NotifFeatures extends StatelessWidget {
  const NotifFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          backgroundColor: Colors.white,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 19,
                  ),
                  Center(
                    child: Container(
                      width: 36,
                      height: 2,
                      color: const Color(0xff838BAA),
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Your notification',
                      style: GoogleFonts.overpass(
                          color: const Color(0xFF444D71),
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
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'New',
                      style: GoogleFonts.overpass(
                        color: const Color(0xFF444D71),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  NotifCard(
                    iconCard: Icons.sunny,
                    clrIcon: const Color(0xff444E72),
                    dateTxt: '10 minutes ago',
                    clrDate: const Color(0xFF444D71),
                    clrTxt: const Color(0xFF444D71),
                    valueTxt:
                        'A sunny day in your location, consider wearing your UV protection',
                    bgCard: const Color(0xff95E5FF).withOpacity(0.28),
                    drpClr: const Color(0xFF444E72),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Earlier',
                      style: GoogleFonts.overpass(
                        color: const Color(0xFF444D71),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const NotifCard(
                    iconCard: Iconsax.wind,
                    clrIcon: Color(0xff838BAA),
                    dateTxt: '10 minutes ago',
                    clrDate: Color(0xff838BAA),
                    clrTxt: Color(0xff838BAA),
                    valueTxt:
                        'A cloudy day will occur all day long, don\'t worry about the heat of the sun',
                    bgCard: Colors.transparent,
                    drpClr: Color(0xFF444E72),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const NotifCard(
                    iconCard: Iconsax.cloud_drizzle,
                    clrIcon: Color(0xff838BAA),
                    dateTxt: '2 days ago',
                    clrDate: Color(0xff838BAA),
                    clrTxt: Color(0xff838BAA),
                    valueTxt:
                        'Potential for rain today is 84%, don\'t forget to bring your umbrella.',
                    bgCard: Colors.transparent,
                    drpClr: Color(0xFF444E72),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: SvgPicture.asset('assets/icons/notif_on.svg'),
    );
  }
}
