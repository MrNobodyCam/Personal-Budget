import 'package:flutter/material.dart';
class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF0B004B),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Total Balance",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "\$ 0.000 ",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 35,
                  width: 145,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8B8B),
                    ),
                    label: const Text("Set Spending",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),),
                    icon: const Icon(Icons.add,color: Colors.white,size: 19,),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Daily Expenses",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "\$ 0.000 ",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 35,
                  width: 145,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4E49B6),
                    ),
                    label: const Text("Add expense",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),),
                    icon: const Icon(Icons.add,color: Colors.white,size: 19,),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}