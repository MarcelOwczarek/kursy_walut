// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kursy_walut/app/features/FirstPage/cubit/first_page_cubit.dart';
// import 'package:kursy_walut/app/models/CurrencyModel.dart';
import 'package:kursy_walut/app/repositories/CurrencyRepositoryEURO.dart';
import 'package:kursy_walut/app/widgets/CurrencyContainer.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirstPageCubit(
        CurrencyRepositoryEURO(),
      ),
      child: BlocListener<FirstPageCubit, FirstPageState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage =
                state.errorMessage ?? 'Wystąpił nieoczekiwany błąd';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<FirstPageCubit, FirstPageState>(
          builder: (context, state) {
            final CurrencyModel = state.model;
            //
            //
            //
            return Builder(
              builder: (context) {
                if (state.status == Status.loading) {
                  return const Text('Trwa ładowanie');
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (CurrencyModel != null)
                      CurrencyContainer(currencyModel: CurrencyModel),
                    // testing(),
                  ],
                );
              },
            );
            //
            //
            //
          },
        ),
      ),
    );
  }
}

// class testing extends StatelessWidget {
//   const testing({
//     super.key,
//     required this.currencyModel,
//   });

//   final CurrencyModel currencyModel;

//   @override
//   Widget build(BuildContext context) {
//     return Text(currencyModel.exchangerate as String);
//   }
// }
