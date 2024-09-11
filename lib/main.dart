import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/presentation/pages/onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      // theme: ThemeData(
      //   scrollbarTheme: ScrollbarThemeData(
      //     thumbColor: WidgetStateProperty.all<Color>(Colors.white),
      //     trackColor: WidgetStateProperty.all<Color>(Colors.transparent),
      //     thickness: WidgetStateProperty.all<double>(5),
      //     radius: const Radius.circular(8),
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      home: OnBoard(),
    );
  }
}
