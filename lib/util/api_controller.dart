import 'package:crypto_tracker/util/json_decode.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class GetApi extends GetxController {
  static String apiKey = "";
  String coinToCall = "bitcoin%2C%20ethereum";
  String currency = "usd";
  StringBuffer result = StringBuffer();
    List cryptoList = [
    ["bitcoin"],
    ["ethereum"]
  ];
  RxList<Welcome> coinsList= <Welcome>[].obs;
  RxBool isLoading = true.obs;

  @override
  onInit(){
    super.onInit();
    getCryptos();
  }

  getCryptos() async {
    for (int i = 0; i < cryptoList.length; i++) {
      result.write(cryptoList[i]);
      if (i < cryptoList.length - 1) {
        result.write('%2C%20'); // Append %2C%20 between items
      }
    }
    //coins = result.toString();
    try{
      isLoading(true);
      var response = await http.get(
        Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currency&ids=$coinToCall"), 
        headers: {
          "x-cg-api-key": apiKey,
          "Accept": "application/json",
        });
      welcomeFromJson(response.body);

      List<Welcome> coins = welcomeFromJson(response.body);
      coinsList.value = coins;

    } finally {
      isLoading(false);
    };
    //call function to decode json
    //final welcome = welcomeFromJson(jsonString);
  }

}