import 'package:crypto_tracker/util/coin_tile.dart';
import 'package:crypto_tracker/util/json_decode.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //coinmarketcap key
  //static String apiKey = "0710785d-895a-4417-9c89-ee6aafe2ae35";

  //coigecko key
  static String apiKey = "CG-yCpNyYJHsY8wJJtdkZxfn1np";
  String coins = "bitcoin%2C%20ethereum";
  String currency = "usd";
  StringBuffer result = StringBuffer();

  List cryptoList = [
    ["bitcoin"],
    ["ethereum"]
  ];


  //makes API call with desired currencies
  Future getCryptos() async {
    for (int i = 0; i < cryptoList.length; i++) {
      result.write(cryptoList[i]);
      if (i < cryptoList.length - 1) {
        result.write('%2C%20'); // Append %2C%20 between items
      }
    }
    coins = result.toString();

    var response = await http.get(
      Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currency&ids=$coins"), 
      headers: {
      "x-cg-api-key": apiKey,
      "Accept": "application/json",
      },
    );
    print(response.body);
    welcomeFromJson(response.body);

    //call function to decode json
    //final welcome = welcomeFromJson(jsonString);
  }

  void editList() {

  }

  @override
  Widget build(BuildContext context) {
    //getCryptos();

    return Scaffold(
      
      appBar: AppBar(
        title: Text("Crypto Tracker"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () => editList(),
      child: Icon(Icons.edit),
      ),
      body: ListView.builder(
        itemCount: cryptoList.length,
        itemBuilder: (context, index) {
          return coinTile(coinName: "btc");
        },
      )
    );
  }
}