import 'package:crypto_tracker/util/coin_tile.dart';
import 'package:crypto_tracker/util/json_decode.dart';
import 'package:flutter/material.dart';

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

  void editList() {

  }

  @override
  Widget build(BuildContext context) {
    //getCryptos();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 77, 55, 72),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 54, 39, 51),
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