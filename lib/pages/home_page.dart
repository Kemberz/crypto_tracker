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

  List cryptoList = [
    ["BTC"],
    ["ETH"]
  ];

  Future getCryptos() async {
    var response = await http.get(
      Uri.parse("https://pro-api.coingecko.com/api/v3/"), 
      headers: {
      'x-cg-pro-api-key': apiKey,
      "Accept": "application/json",
      },
    );
    print(response.body);
  }

  void editList() {

  }

  @override
  Widget build(BuildContext context) {
    getCryptos();
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
        },
      )
    );
  }
}