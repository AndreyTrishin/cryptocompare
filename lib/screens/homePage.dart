import 'package:first_flutter_project/APIRequests.dart';
import 'package:first_flutter_project/models/currency.dart';
import 'package:first_flutter_project/screens/currencyPage.dart';
import 'package:flutter/material.dart';

import 'SettingsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Currency> list = <Currency>[];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var list = APIRequest.getCurrencyList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Сryptocompare'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: FutureBuilder(
        future: list,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].name),
                  trailing: Text('\$ ' + snapshot.data[index].price.toString()),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network('https://www.cryptocompare.com/' +
                        snapshot.data[index].imageUrl),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CurrencyPage(snapshot.data[index])));
                  },
                );
              },
              itemCount: snapshot.data.length,
            );
          } else {
            return const Center(
              child: Text('Ошибка'),
            );
          }
        },
      ),
    );
  }
}
