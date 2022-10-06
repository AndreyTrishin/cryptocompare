import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String currentCurr = 'USD';
  List<List<String>> list = [
    ['Рубли', 'RUB'],
    ['Доллары', 'USD'],
    ['Евро', 'EUR'],
  ];

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      setState(() {
        currentCurr = prefs.getString('currentCurrency') ?? 'USD';
      });
    });
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
            subtitle: Text(currentCurr),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        child: ListView.separated(
                            itemBuilder: (context, index) => ListTile(
                                  title: Text(list[index][0]),
                                  subtitle: Text(list[index][1]),
                                  trailing: Icon(
                                    currentCurr != list[index][1]
                                        ? Icons.radio_button_off
                                        : Icons.radio_button_checked,
                                    color: Colors.black,
                                  ),
                                  onTap: () {
                                    _prefs.then((value) {
                                      value.setString(
                                          'currentCurrency', list[index][1]);
                                      setState(() {
                                        currentCurr = list[index][1];
                                      });
                                      Navigator.pop(context);
                                    });
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
