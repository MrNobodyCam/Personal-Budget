import 'package:flutter/material.dart';
import 'package:personal_budget/screen/transaction/expense_item.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({super.key});

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpenseItem(),
      ],
    );
  }
}
