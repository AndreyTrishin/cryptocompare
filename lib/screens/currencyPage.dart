import 'dart:io';

import 'package:first_flutter_project/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrencyPage extends StatelessWidget {
  Currency _currency;

  CurrencyPage(Currency currency) : _currency = currency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(_currency.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Наименование: ' + _currency.name),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Сокращённое название: ' + _currency.shortName),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Цена: \$ ' + _currency.price.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  launchUrl(Uri.parse('https://www.cryptocompare.com' + _currency.url));
                },
                child: Text('Страница монеты',
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),),
              ),
              // child: Link('Страница монеты: ' + _currency.url),
            ),
          ],
        ),
      ),
    );
  }
}
