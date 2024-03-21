import 'package:first_flutter_project/APIRequests.dart';
import 'package:first_flutter_project/blocs/cryptolist_bloc/CryptoListBloc.dart';
import 'package:first_flutter_project/models/currency.dart';
import 'package:first_flutter_project/screens/currencyPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SettingsPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Currency> list = <Currency>[];

class _HomePageState extends State<HomePage> {



  final _cryptoListBloc = CryptoListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Сryptocompare'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage(_cryptoListBloc)));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: BlocBuilder(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if(state is CryptoListLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.list[index].name),
                  trailing: Text('\$ ' + state.list[index].price.toStringAsFixed(4)),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network('https://www.cryptocompare.com/' +
                        state.list[index].imageUrl),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CurrencyPage(state.list[index])));
                  },
                );
              },
              itemCount: 100,
            );
          } else if (state is CryptoListLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          return Center(child: Text('Ошибка'),);
        },
      ),
    );
  }

  @override
  void initState() {
    _cryptoListBloc.add(CryptoListLoad());
    super.initState();
  }
}
