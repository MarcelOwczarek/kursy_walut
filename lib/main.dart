import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          appBar: AppBar(
            title: Center(
              child: Text(
                'Kursy walut',
                style: GoogleFonts.raleway(letterSpacing: 2),
              ),
            ),
            backgroundColor: Colors.grey[900],
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
              ],
            ),
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
            child: Builder(
              builder: (context) {
                if (currentIndex == 0) {
                  return const CurrencyContainer();
                }
                return const CurrencyContainer();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CurrencyContainer extends StatelessWidget {
  const CurrencyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 505,
            width: 340,
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF292E49),
                  Color(0xFF536976),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Data aktualnego kursu',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1 EUR - ',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 23),
                    ),
                    Text(
                      '4,71 zł',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text('Wykres ostatnie 30 dni ',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Divider(
                    thickness: 3,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
