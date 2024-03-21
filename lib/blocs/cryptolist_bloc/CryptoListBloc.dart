import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:first_flutter_project/models/currency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../APIRequests.dart';

part 'CryptoListEvent.dart';

part 'CryptoListState.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc() : super(CryptoListInitial()) {
    on<CryptoListLoad>((
      event,
      Emitter<CryptoListState> emit,
    ) async {
      emit(CryptoListLoading());
      final list = await APIRequest.getCurrencyList(event.currency);
      emit(CryptoListLoaded(list, event.currency));
    });
  }
}
