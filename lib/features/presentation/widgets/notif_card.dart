import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifCard extends StatelessWidget {
  final IconData iconCard;
  final String dateTxt;
  final Color clrDate;
  final String valueTxt;
  final Color clrTxt;
  final Color bgCard;
  final Color clrIcon;
  final Color drpClr;
  const NotifCard(
      {super.key,
      required this.iconCard,
      required this.clrIcon,
      required this.dateTxt,
      required this.clrDate,
      required this.clrTxt,
      required this.valueTxt,
      required this.bgCard,
      required this.drpClr});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 96,
      // color: const Color(0xff95E5FF).withOpacity(0.28),
      color: bgCard,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconCard,
            // color: Color(0xff444E72),
            color: clrIcon,
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 254,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  // '10 minutes ago',
                  dateTxt,
                  style: GoogleFonts.overpass(
                    // color: const Color(0xFF444D71),
                    color: clrDate,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
                Text(
                  // 'A sunny day in your location,  consider wearing your UV protection',
                  valueTxt,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.overpass(
                    // color: const Color(0xFF444D71),
                    color: clrTxt,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 0.9,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            // color: Color(0xff444E72),
            color: drpClr,
          )
        ],
      ),
    );
  }
}
