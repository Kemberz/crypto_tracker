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
              backgroundColor: Colors.purple.shade800,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 190, 143, 188),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                    padding: const EdgeInsets.all(10),
                    child: Image.network(cryptoIcon),
                  ),
              ),
              //task name
              Text(
                "BTC"
              ),
            ],
          ),
        ),
      ),
    );
  }
}