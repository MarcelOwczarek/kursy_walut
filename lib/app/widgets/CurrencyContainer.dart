// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencyContainer extends StatelessWidget {
  const CurrencyContainer({
    super.key,
    required this.date,
    required this.exchange_rate,
    required this.currency_type,
  });

  final String date;
  final String exchange_rate;
  final String currency_type;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Custom Container
        //
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 505,
            width: 340,
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // Custom gradient
              //
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF292E49),
                  Color(0xFF536976),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            // Container content
            //
            child: Column(
              children: [
                // Current date
                //
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(date,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15)),
                  ),
                ),
                // Currency exchange rate
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currency_type,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 23)),
                    Text(exchange_rate,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 25)),
                  ],
                ),
                const SizedBox(height: 25),
                const Last30days(),
                const CustomDivider(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//
//

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Divider(
        thickness: 3,
        color: Colors.grey,
      ),
    );
  }
}

class Last30days extends StatelessWidget {
  const Last30days({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Wykres ostatnie 30 dni ',
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 20));
  }
}
