import 'package:flutter/material.dart';
import 'package:personal_budget/model/expense.dart';
import 'package:personal_budget/screen/transaction/expense_item.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({super.key, required this.listExpense});
  final ListExpense listExpense;

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {

  void removeExpense(int index) {
    setState(() {
      widget.listExpense.removeExpense(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.listExpense.expenseList.isEmpty
          ? const Center(
        child: Text(
          "No Expenses Found",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: widget.listExpense.expenseList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(widget.listExpense.expenseList[index]),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                widget.listExpense.removeExpense(index);
              });
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ExpenseItem(expense: widget.listExpense.expenseList[index]),
          );
        },
      ),
    );
  }
}
