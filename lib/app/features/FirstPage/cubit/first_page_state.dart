part of 'first_page_cubit.dart';

class FirstPageState {
  const FirstPageState({
    this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final CurrencyModel? model;
  final Status status;
  final String? errorMessage;
}

//

enum Status { initial, loading, success, error }
