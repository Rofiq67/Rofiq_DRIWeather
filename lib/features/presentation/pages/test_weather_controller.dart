//  Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Next Forecast',
//                           style: GoogleFonts.overpass(
//                               color: Colors.white,
//                               fontSize: 24,
//                               fontWeight: FontWeight.w900,
//                               height: 0,
//                               shadows: [
//                                 Shadow(
//                                   offset: const Offset(-2, 3),
//                                   blurRadius: 8,
//                                   color: Colors.black.withOpacity(0.25),
//                                 ),
//                               ]),
//                         ),
//                         const Icon(
//                           Icons.date_range_outlined,
//                           color: Colors.white,
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       height: 312,
//                       child: RawScrollbar(
//                         thumbVisibility: true,
//                         radius: const Radius.circular(8),
//                         thickness: 5,
//                         thumbColor: Colors.white,
//                         trackColor: Colors.transparent,
//                         trackBorderColor: Colors.white,
//                         trackRadius: const Radius.circular(18),
//                         // trackVisibility: true,
//                         child: ListView.builder(
//                           padding: EdgeInsets.zero,
//                           itemCount: 15,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 8, horizontal: 16),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Sep, ${13 + index}',
//                                     style: GoogleFonts.overpass(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w700,
//                                         height: 0,
//                                         shadows: [
//                                           Shadow(
//                                             offset: const Offset(-2, 3),
//                                             blurRadius: 8,
//                                             color:
//                                                 Colors.black.withOpacity(0.25),
//                                           ),
//                                         ]),
//                                   ),
//                                   Image.asset(
//                                     'assets/images/cloudy_.png',
//                                     width: 55,
//                                   ),
//                                   Text(
//                                     '${20 + index}°',
//                                     style: GoogleFonts.overpass(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w700,
//                                         height: 0,
//                                         shadows: [
//                                           Shadow(
//                                             offset: const Offset(-2, 3),
//                                             blurRadius: 8,
//                                             color:
//                                                 Colors.black.withOpacity(0.25),
//                                           ),
//                                         ]),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 32,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.sunny,
//                           color: Colors.white,
//                         ),
//                         const SizedBox(
//                           width: 14,
//                         ),
//                         Text(
//                           'DRI Weather',
//                           style: GoogleFonts.overpass(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                               height: 0,
//                               shadows: [
//                                 Shadow(
//                                   offset: const Offset(-2, 3),
//                                   blurRadius: 8,
//                                   color: Colors.black.withOpacity(0.25),
//                                 ),
//                               ]),
//                         ),
//                       ],
//                     )
//                   ],