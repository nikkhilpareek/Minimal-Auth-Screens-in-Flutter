import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:start/pages/onboarding_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}

