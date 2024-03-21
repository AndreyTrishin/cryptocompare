part of 'CryptoListBloc.dart';

class CryptoListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  final List<Currency> list;
  final String currentCurrency;

  CryptoListLoaded(this.list, this.currentCurrency);

  @override
  List<Object?> get props => [list];
}
