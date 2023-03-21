// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:kursy_walut/app/models/CurrencyModel.dart';

class CurrencyRepositoryEURO {
  Future<CurrencyModel?> getCurrencyModel({
    required String currentdate,
    required String exchangerate,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'https://api.nbp.pl/api/exchangerates/rates/a/eur/');
    final responseData = response.data;
    if (responseData != null) {
      final currentdate =
          responseData['ExchangeRatesSeries']['EffectiveDate'] as String;
      final exchangerate =
          (responseData['ExchangeRatesSeries']['Mid'] + 0.0) as double;
      print(currentdate);
      print(exchangerate);
    }
    return const CurrencyModel(currentdate: '21.03.2022', exchangerate: '4,71');
  }
}
