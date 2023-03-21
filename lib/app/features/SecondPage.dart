// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:kursy_walut/app/widgets/CurrencyContainer.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CurrencyContainer(
      date: '21.02.2023',
      exchange_rate: '4,39 zł',
      currency_type: '1 USD - ',
    );
  }
}
