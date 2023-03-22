// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:kursy_walut/app/models/CurrencyModel.dart';
import 'package:kursy_walut/app/repositories/CurrencyRepositoryEURO.dart';

part 'first_page_state.dart';

class FirstPageCubit extends Cubit<FirstPageState> {
  FirstPageCubit(this._currencyRepository) : super(const FirstPageState());

  final CurrencyRepositoryEURO _currencyRepository;

  Future<void> getCurrencyModel({
    required String currentdate,
    required double exchangerate,
  }) async {
    emit(const FirstPageState(status: Status.loading));
    try {
      final CurrencyModel = await _currencyRepository.getCurrencyModel(
          currentdate: currentdate, exchangerate: exchangerate);
      emit(
        FirstPageState(
          model: CurrencyModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        FirstPageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
