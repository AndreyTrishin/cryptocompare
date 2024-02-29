import 'dart:convert';

import 'package:first_flutter_project/models/currency.dart';
import 'package:http/http.dart' as http;

class APIRequest {
  static String server = "";

  static Future<List<Currency>> getCurrencyList() async {
    var responce = await http.get(
        Uri.parse('https://min-api.cryptocompare.com/data/top/totalvolfull?limit=100&tsym=USD'));
    List<Currency> list = [];
    var bodyDecoded = jsonDecode(responce.body);
    for (var cur in bodyDecoded['Data']) {
      try {
        list.add(Currency(
            int.parse(cur['CoinInfo']['Id']),
            cur['CoinInfo']['FullName'],
            cur['CoinInfo']['Name'],
            cur['RAW']['USD']['PRICE'],
            cur['CoinInfo']['ImageUrl'],
            cur['CoinInfo']['Url']));
      } catch (ex) {
        print(ex);
        print(cur);
      }
    }
    return list;
  }
}
// Url
