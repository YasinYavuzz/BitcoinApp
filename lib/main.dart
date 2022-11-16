import 'package:bitcoin_app_example/model/bitcoin_model.dart';
import 'package:bitcoin_app_example/services/bitcoin_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //BitcoinProvider? bitcoinProvider;
  List<BitcoinModel> bitcoinModel = [];
  @override
  void initState() {
    super.initState();
    //bitcoinProvider = Provider.of<BitcoinProvider>(context, listen: false);
    bitcoinModel = getCurrentCoin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Center(
          child: Text(
            'CRYPTOBASE',
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: bitcoinModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              //padding: EdgeInsets.all(10),
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.grey,
                        offset: Offset(10, 10))
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                        height: 75,
                        width: 75,
                        child: Image.network('${bitcoinModel[index].imageUrl}'
                            //'${bitcoinModel!.model![index].imageUrl}'
                            )
                            ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${bitcoinModel[index].name}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'btc',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${bitcoinModel[index].price}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
