import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          appBar: AppBar(
            title: Center(
              child: Text(
                'Kursy walut',
                style: GoogleFonts.raleway(letterSpacing: 2),
              ),
            ),
            backgroundColor: Colors.grey[900],
            bottom: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white10,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'EUR',
                      style: GoogleFonts.raleway(),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'USD',
                      style: GoogleFonts.raleway(),
                    ),
                  ),
                ]),
          ),
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
            child: const Text(''),
          ),
        ),
      ),
    );
  }
}
