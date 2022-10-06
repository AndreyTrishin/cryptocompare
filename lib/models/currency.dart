class Currency {
  int id;
  String name;
  String shortName;
  double price;
  String imageUrl;
  String url;

  Currency(this.id, this.name, this.shortName, this.price, this.imageUrl, this.url);
  //
  // factory Currency.fromJson(Map<String, dynamic> json){
  //   return Currency(json['Id'] as int, json['FullName'] as String, json['Name'] as String, 0);
  // }
}

// https://www.cryptocompare.com/media/37746251/btc.png