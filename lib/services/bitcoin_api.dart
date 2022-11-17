import 'dart:convert';
import 'dart:developer';
import 'package:bitcoin_app_example/model/bitcoin_model.dart';
import 'package:http/http.dart' as http;

getCurrentCoin(List<BitcoinModel> coins) async {
  final response = await http.get(Uri.parse(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=30&page=1&sparkline=false'));
  return DataList.fromJson(jsonDecode(response.body)).dataList;
}
