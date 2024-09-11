import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rekadigital_flutter/features/presentation/pages/home.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff4A9EF7), Color(0xffFFFFFF)],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                left: -277,
                top: -247,
                child: Container(
                  width: 580,
                  height: 580,
                  decoration: const ShapeDecoration(
                    color: Color(0x380E8AE4),
                    shape: OvalBorder(),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -37,
                top: -132,
                child: SizedBox(
                  width: 789,
                  height: 789,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 309.41,
                        top: 309.41,
                        child: Container(
                          width: 170.18,
                          height: 170.18,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.white
                                    .withOpacity(0.6499999761581421),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 201.12,
                        top: 201.12,
                        child: Container(
                          width: 386.76,
                          height: 386.76,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.white
                                    .withOpacity(0.6499999761581421),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 100.56,
                        top: 100.56,
                        child: Container(
                          width: 587.88,
                          height: 587.88,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.white
                                    .withOpacity(0.6499999761581421),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 789,
                          height: 789,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.white
                                    .withOpacity(0.6499999761581421),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -88.32,
                top: 69.52,
                child: SvgPicture.asset('assets/svg/GroupSun.svg'),
              ),
              Positioned(
                left: 60.72,
                top: 280,
                child: SvgPicture.asset('assets/svg/cloud.svg'),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 480,
                    ),
                    SizedBox(
                      width: 306,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Never get caught',
                            style: GoogleFonts.overpass(
                              color: const Color(0xFF494A4B),
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              height: 0.03,
                              letterSpacing: -1.80,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'in the rain again',
                            style: GoogleFonts.overpass(
                              color: const Color(0xFF494A4B),
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              height: 0.03,
                              letterSpacing: -1.80,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: 314,
                      height: 41.93,
                      child: Text(
                        'Stay ahead of the weather with our accurate forecasts',
                        style: GoogleFonts.overpass(
                          color: const Color(0xFF494A4B),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: 306,
                      height: 64,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 32,
                          offset: Offset(-4, 8),
                          spreadRadius: 4,
                        )
                      ]),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const Home());
                        },
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.overpass(
                            color: const Color(0xFF444D71),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
              //
            ],
          )),
    );
  }
}
