import 'package:flutter/material.dart';
import 'package:personal_budget/screen/transaction/expense_item.dart';
import 'package:personal_budget/data/data.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({super.key});

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    final categoryFilter = expenseList.checkCategory;

    final filteredExpenses = categoryFilter == 1
        ? expenseList.expenseList
        : expenseList.expenseList
        .where((expense) => expense.category.index + 2 == categoryFilter)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: filteredExpenses.isEmpty
          ? const Center(
        child: Text(
          "No Expenses Found",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: filteredExpenses.length,
        itemBuilder: (context, index) {
          int reverseIndex = filteredExpenses.length - 1 - index;

          return ExpenseItem(
            expense: filteredExpenses[reverseIndex],
            listExpense: expenseList,
            expenseIndex: reverseIndex,
            balance: sharedBalance,
          );
        },
      ),
    );
  }
}
