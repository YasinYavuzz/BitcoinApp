import 'package:bitcoin_app_example/controller/bitcoin_provider.dart';
import 'package:bitcoin_app_example/model/bitcoin_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// Bitcoin Uygulaması

// => Mvvm mimariye göre çalışma
// => services -> apiden gelen bilgileri aldığım kısım
// => model -> apiden hangi verileri istiyorsam ona göre modelimi oluşturuyorum.
// => controller -> sağlayıcılarımın (provider) olduğu kısım

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BitcoinProvider>(
            create: (context) => BitcoinProvider())
      ],
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BitcoinProvider? bitcoinProvider;
  List<BitcoinModel> bitcoinModel = [];
  @override
  void initState() {
    super.initState();
    bitcoinProvider = Provider.of<BitcoinProvider>(context, listen: false);
  }

  @override
  Future<void> didChangeDependencies() async {
    
    super.didChangeDependencies();
    await bitcoinProvider?.getBitcoinData();
    bitcoinModel = bitcoinProvider!.model;
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
      body: Consumer(
        builder: (BuildContext context, BitcoinProvider value, Widget? child) { 
          return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: value.model.length,
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
                                child:
                                    Image.network('${value.model[index].image}'
                                        //'${bitcoinModel!.model![index].imageUrl}'
                                        )),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${value.model[index].name}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${value.model[index].symbol}',
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
                                  '${value.model[index].currentPrice}',
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
              );
         },
        
      ),
    );
  }
}
