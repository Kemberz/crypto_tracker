import 'package:crypto_tracker/util/json_decode.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class GetApi extends GetxController {
  static String apiKey = "";
  String coins = "bitcoin%2C%20ethereum";
  String currency = "usd";
  StringBuffer result = StringBuffer();
    List cryptoList = [
    ["bitcoin"],
    ["ethereum"]
  ];
  List<Welcome> coinsList= <Welcome>[];

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

}