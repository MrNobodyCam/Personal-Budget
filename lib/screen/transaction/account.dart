import 'package:flutter/material.dart';
import 'package:personal_budget/data/data.dart';
import 'package:personal_budget/screen/transaction/set_spending.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'add_expense.dart';

class BalanceCard extends StatefulWidget {

  const BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  Color color = Colors.white;
  @override
  void initState(){
    super.initState();
    checkSpending();
  }
  void checkSpending(){
    if(sharedBalance.overSpending() == true){
      print("Spend Over");
      color = Colors.red;
    }else{
      color = Colors.white;
    }
  }
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
                  "This Month Balance",
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
                Text(
                  "Expenses",
                  style: TextStyle(
                      fontSize: 17,
                      color: color,
                      fontWeight: FontWeight.bold),
                ),
                ValueListenableBuilder<double>(
                  valueListenable: sharedBalance.expenseNotifier,
                  builder: (context, balance, child) {
                    return Text(
                      "\$ ${sharedBalance.expenseNotifier.value.toStringAsFixed(2)} ",
                      style: TextStyle(
                          fontSize: 30,
                          color: color,
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
                      if(sharedBalance.balanceNotifier.value == 0){
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Oops...',
                          text: 'Please set this month\'s balance before adding an expense.',
                        );
                      }else{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AddExpense(),
                        );
                      }
                      // LocalNotification.showSimpleNotification(title: "Budget Alert!", body: "You’ve exceeded your budget.", payload: "payload");
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
