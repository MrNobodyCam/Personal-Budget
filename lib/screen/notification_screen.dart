import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_budget/data/data.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 29, left: 10),
                    child: Transform.rotate(
                      angle: pi,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Navigator.pop(
                          //     context); // Go back to the previous screen
                        },
                        icon: Image.asset(
                          'assets/icon/arrow.png',
                          width: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Text(
                "Notification",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                // textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: expenseList.overSpending.isEmpty? Center(
        child: Text("No Notification Yet",style: TextStyle(fontSize: 18,color: Colors.grey),),
      ) : ListView.builder(
        itemCount: expenseList.overSpending.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: Key(expenseList.overSpending[index].id),
              onDismissed: (direction){
                setState(() {
                  expenseList.removeOverSpend(index);
                });
              },
              background: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.delete,size: 40,color: Colors.white,),
                      SizedBox(width: 10,),
                    ],
                  )
              ),
              child: NotificationItem(
                title: expenseList.overSpending[index].title,
                amount: expenseList.overSpending[index].amount,
                date: expenseList.overSpending[index].dateTime,
              )
          );
        },
      )
    );
  }
}

// class Header extends StatelessWidget {
//   const Header({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(left: 10,top: 36),
//               child: Transform.rotate(
//                 angle: pi,
//                 child: IconButton(
//                     onPressed: () {
//                       print("Button Clicked");
//                       Navigator.of(context).pop();
//                     },
//                     icon: Image.asset(
//                       "assets/icon/arrow.png",
//                       width: 30,
//                     )),
//               ),
//             ),
//           ],
//         ),
//         const Text("Notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
//       ],
//     );
//   }
// }
class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key,
      required this.title,
      required this.amount,
      required this.date});
  final String title;
  final double amount;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        color: const Color(0xFFD9D9D9),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            Get.back;
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  "assets/icon/warning.png",
                  width: 61,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overspending Detected!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "You've exceeded your budget for \"$title\", amount \"$amount\"! Please review your expenses.",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 7,),
                    Text(
                      "Date : ${date.day}/${date.month}/${date.year}",
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}

// class NotificationList extends StatelessWidget {
//   const NotificationList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         // Container(
//         //   margin: const EdgeInsets.only(left: 10),
//         //   child: const Text("07/Dec/2024",style: TextStyle(fontWeight: FontWeight.bold),),
//         // ),
//         NotificationItem(),
//         NotificationItem(),
//         NotificationItem(),
//         NotificationItem(),
//         NotificationItem(),
//         NotificationItem(),
//         NotificationItem(),
//         NotificationItem(),
//       ],
//     );
//   }
// }
