import 'package:flutter/material.dart';
import 'package:personal_budget/data/data.dart';
import 'package:personal_budget/screen/transaction/set_spending.dart';
import 'package:personal_budget/model/expense.dart';
import 'add_expense.dart';

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
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
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
                  "Monthly Balance",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                ValueListenableBuilder<double>(
                  valueListenable: sharedBalance.balanceNotifier,
                  builder: (context, balance, child) {
                    return Text(
                      "\$ ${sharedBalance.balanceNotifier.value.toStringAsFixed(2)} ",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  width: 119,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => SetSpending(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8B8B),
                    ),
                    child :const Text(
                      "Set Spending",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Expenses",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                ValueListenableBuilder<double>(
                  valueListenable: sharedBalance.expenseNotifier,
                  builder: (context, balance, child) {
                    return Text(
                      "\$ ${sharedBalance.expenseNotifier.value.toStringAsFixed(2)} ",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  width: 124,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AddExpense(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4E49B6),
                    ),
                    child: const Text(
                      "Add expense",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
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
