import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class coinTile extends StatelessWidget {
  final String coinName;
  Function(BuildContext)? notificationFunction;

  coinTile({super.key,
    required this.coinName,
     this.notificationFunction
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
            children: [
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