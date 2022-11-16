import 'dart:convert';
import 'package:bitcoin_app_example/model/bitcoin_model.dart';
import 'package:http/http.dart' as http;

getCurrentCoin() async{
  List<BitcoinModel> currentCoin = [];

  final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=30&page=1&sparkline=false'));
  if(response.statusCode == 200) {
    List values;
    values = jsonDecode(response.body);
    print(values);
    if (values.length > 0) {
      for (var i = 0; i < values.length; i++) {
        if(values != null){
          currentCoin.add(BitcoinModel.fromJson(values[i]));
        }
      }
      print(currentCoin.first.name);
      print(currentCoin.first.imageUrl);
      print(currentCoin.first.price);
    }
    return currentCoin;
  }else{
    throw('Coinler yüklenmedi');
  } 
  
}