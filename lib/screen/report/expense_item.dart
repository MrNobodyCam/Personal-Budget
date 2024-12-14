import 'package:flutter/material.dart';

class ExpenseItem extends StatefulWidget {
  const ExpenseItem({super.key});

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      color: Colors.white,
      margin: const EdgeInsets.only(left: 13, right: 13,bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/category/utility.png"),
            ),
            const SizedBox(width: 13),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("School Expense"),
                Text("07/Dec/2024"),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.download,size: 35,))
          ],
        ),
      ),
    );
  }
}
