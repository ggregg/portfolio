import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_browser.dart';
import 'package:portfolio/portfolio/portfolio_view.dart';

void main() async {
  await findSystemLocale();
  await initializeDateFormatting();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gregoire GUYON',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline2: GoogleFonts.montserrat(color: Colors.black),
          headline4: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      home: PortfolioView(),
    );
  }
}
