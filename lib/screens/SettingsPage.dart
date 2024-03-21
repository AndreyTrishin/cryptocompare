import 'package:first_flutter_project/blocs/cryptolist_bloc/CryptoListBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  CryptoListBloc _cryptoListBloc = CryptoListBloc();

  SettingsPage(this._cryptoListBloc);

  @override
  State<SettingsPage> createState() => _SettingsPageState(_cryptoListBloc);
}

class _SettingsPageState extends State<SettingsPage> {
  CryptoListBloc _cryptoListBloc = CryptoListBloc();

  _SettingsPageState(this._cryptoListBloc);

  List<List<String>> list = [
    ['Рубли', 'RUB'],
    ['Доллары', 'USD'],
    ['Евро', 'EUR'],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Настройки'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Валюта'),
            subtitle: Text(
                (_cryptoListBloc.state as CryptoListLoaded).currentCurrency),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        child: ListView.separated(
                            itemBuilder: (context, index) => ListTile(
                                  title: Text(list[index][0]),
                                  subtitle: Text(list[index][1]),
                                  trailing: Icon(
                                    (_cryptoListBloc.state as CryptoListLoaded)
                                                .currentCurrency !=
                                            list[index][1]
                                        ? Icons.radio_button_off
                                        : Icons.radio_button_checked,
                                    color: Colors.black,
                                  ),
                                  onTap: () {
                                    _cryptoListBloc.add(CryptoListLoad(
                                        currency: list[index][1]));
                                    Navigator.pop(context);
                                  },
                                ),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: list.length),
                      ));
            },
          )
        ],
      ),
    );
  }
}
