// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:kursy_walut/app/models/CurrencyModel.dart';

class CurrencyRepositoryEURO {
  Future<CurrencyModel?> getCurrencyModel({
    required String currentdate,
    required double exchangerate,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'https://api.nbp.pl/api/exchangerates/rates/a/eur/');
    final responseData = response.data;

    if (responseData == null) {
      return null;
    }

    final currentdate =
        responseData['ExchangeRatesSeries']['EffectiveDate'] as String;
    final exchangerate =
        (responseData['ExchangeRatesSeries']['Mid'] + 0.0) as double;

    return CurrencyModel(currentdate: currentdate, exchangerate: exchangerate);
  }
}
