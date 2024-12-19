import 'package:flutter/material.dart';
import 'package:personal_budget/model/expense.dart';
import 'package:personal_budget/screen/transaction/category_card.dart';
import '../app_bar.dart';
import '../bottom_bar.dart';
import 'account.dart';
import 'expense_list.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key,required this.balance,required this.listExpense});
  final Balance balance;
  final ListExpense listExpense;
  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(),
      body: Column(
        children: [
          BalanceCard(valueBalance: widget.balance,expenseList: widget.listExpense,),
          CategoryCard(),
          // Text(
          //   "All Items",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Expanded(child: ExpenseList(listExpense: widget.listExpense,))
        ],
      ),
      bottomNavigationBar: const BottomBar(
        checkSelect: 1,
      ),
    );
  }
}
