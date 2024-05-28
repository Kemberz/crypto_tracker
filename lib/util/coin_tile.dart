import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class coinTile extends StatelessWidget {
  final String coinName;
  Function(BuildContext)? notificationFunction;
  final String cryptoIcon;

  coinTile({super.key,
    required this.coinName,
    this.notificationFunction,
    this.cryptoIcon = 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400',
  });

  @override
  Widget build(BuildContext context) {
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
                          child: Image.network(cryptoIcon),
                        ),
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //COIN NAME
                    Text("Bitcoin", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
                    //COIN 24H CHANGE
                    Text("10%", style: TextStyle(fontSize: 16, color: Colors.grey[400], fontWeight: FontWeight.w600),),
                  ],
                ),
                ],
              ),
              const SizedBox(width: 20,),
              Column(
                children: [
                  //24H HIGH
                  Text("H\$"+"66.678", style: TextStyle(fontSize: 12, color: Colors.grey[400], fontWeight: FontWeight.w600),),
                    //24H LOW
                  Text("L\$""64.786", style: TextStyle(fontSize: 12, color: Colors.grey[400], fontWeight: FontWeight.w600),),
                ],
              ),
              Column(children: [
                //COIN PRICE
                Text("\$"+"66.000", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
              ],),

              //task name
            ],
          ),
        ),
      ),
    );
  }
}