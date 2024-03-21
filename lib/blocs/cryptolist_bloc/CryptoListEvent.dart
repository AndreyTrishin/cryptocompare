part of 'CryptoListBloc.dart';

class CryptoListEvent {}

class CryptoListLoad extends CryptoListEvent{
  final String currency;

  CryptoListLoad({this.currency = "usd"});
}