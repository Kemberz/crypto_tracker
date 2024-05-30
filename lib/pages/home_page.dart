import 'package:crypto_tracker/util/api_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //coinmarketcap key
  //static String apiKey = "0710785d-895a-4417-9c89-ee6aafe2ae35";

  //coigecko key
  final GetApi controller = Get.put(GetApi());
  String coins = "bitcoin%2C%20ethereum";
  String currency = "usd";
  Function(BuildContext)? notificationFunction;
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
      body: Obx(
        ()=> controller.isLoading.value ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
          itemCount: cryptoList.length,
          itemBuilder: (context, index) {
            return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: notificationFunction,
              icon: Icons.edit,
              backgroundColor: const Color.fromARGB(255, 72, 7, 112),
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 71, 59, 71),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[700]!,
                            offset: const Offset(2, 2),
                          )
                      ]),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          //COIN ICON
                          child: Image.network(controller.coinsList[index].image),
                        ),
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //COIN NAME
                    Text(controller.coinsList[index].name, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
                    //COIN 24H CHANGE
                    Text((controller.coinsList[index].priceChangePercentage24H !).toStringAsFixed(2) + "%", style: TextStyle(fontSize: 16, color: Colors.grey[400], fontWeight: FontWeight.w600),),
                  ],
                ),
                ],
              ),
              const SizedBox(width: 20,),
              Column(
                children: [
                  //24H HIGH
                  Text("H\$"+controller.coinsList[index].high24H.toString(), style: TextStyle(fontSize: 12, color: Colors.grey[400], fontWeight: FontWeight.w600),),
                    //24H LOW
                  Text("L\$"+controller.coinsList[index].low24H.toString(), style: TextStyle(fontSize: 12, color: Colors.grey[400], fontWeight: FontWeight.w600),),
                ],
              ),
              Column(children: [
                //COIN PRICE
                Text("\$"+(controller.coinsList[index].currentPrice).toStringAsFixed(2), style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
              ],),

              //task name
            ],
          ),
        ),
      ),
    );
          },
        ),
      )
    );
  }
}