// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kursy_walut/app/features/FirstPage.dart';
import 'package:kursy_walut/app/features/SecondPage.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          // Custom Appbar
          //
          appBar: AppBar(
            title: Center(
              child: Text(
                'Kursy walut',
                style: GoogleFonts.raleway(letterSpacing: 2),
              ),
            ),
            backgroundColor: Colors.grey[900],
            // Custom TabBar
            //
            bottom: TabBar(
              onTap: (newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white10,
              ),
              // Bookmarks of TabBar
              //
              tabs: [
                Tab(
                  child: Text('EUR', style: GoogleFonts.raleway()),
                ),
                Tab(
                  child: Text('USD', style: GoogleFonts.raleway()),
                ),
              ],
            ),
          ),
          // Background
          //
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF536976),
                  Color(0xFF292E49),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            // Current Index builder
            //
            child: Builder(
              builder: (context) {
                if (currentIndex == 0) {
                  return const FirstPage();
                }
                return const SecondPage();
              },
            ),
          ),
        ),
      ),
    );
  }
}
