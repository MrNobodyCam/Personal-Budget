import 'package:flutter/material.dart';
import 'package:personal_budget/screen/transaction/set_spending.dart';
import 'package:personal_budget/model/expense.dart';
import 'add_expense.dart';

class BalanceCard extends StatefulWidget {
  final Balance valueBalance;
  final ListExpense expenseList;

  const BalanceCard({super.key, required this.valueBalance,required this.expenseList});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {

  void _addExpense(Expense expense) {
    setState(() {
      widget.valueBalance.addExpense(expense.amount);
      // widget. += expense.amount;
      widget.expenseList.addExpense(expense);
    });
  }

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
                ValueListenableBuilder<double>(
                  valueListenable: widget.valueBalance.balanceNotifier,
                  builder: (context, balance, child) {
                    return Text(
                      "\$ ${widget.valueBalance.balanceNotifier.value.toStringAsFixed(2)} ",
                      style: TextStyle(
                          fontSize: 32,
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
                        builder: (BuildContext context) => SetSpending(
                          valueBalance: widget.valueBalance,
                        ),
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
                  "Daily Expenses",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                ValueListenableBuilder<double>(
                  valueListenable: widget.valueBalance.expenseNotifier,
                  builder: (context, balance, child) {
                    return Text(
                      "\$ ${widget.valueBalance.expenseNotifier.value.toStringAsFixed(2)} ",
                      style: TextStyle(
                          fontSize: 32,
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
                        builder: (BuildContext context) => AddExpense(
                          onAddExpense: _addExpense, // Pass the callback
                        ),
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
