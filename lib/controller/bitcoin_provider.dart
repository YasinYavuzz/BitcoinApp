import 'package:bitcoin_app_example/model/bitcoin_model.dart';
import 'package:bitcoin_app_example/services/bitcoin_api.dart';
import 'package:flutter/cupertino.dart';

class BitcoinProvider extends ChangeNotifier{

  List<BitcoinModel> model = []; 
  List values = [];

  getBitcoinData() async{
    model = await getCurrentCoin(model);
    notifyListeners();
  }

}