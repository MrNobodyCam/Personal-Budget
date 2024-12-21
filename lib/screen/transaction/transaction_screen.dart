import 'package:flutter/material.dart';
import 'package:personal_budget/screen/transaction/category_card.dart';
import '../app_bar.dart';
import '../bottom_bar.dart';
import 'account.dart';
import 'expense_list.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});
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
          BalanceCard(),
          CategoryCard(),
          // Text(
          //   "All Items",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Expanded(child: ExpenseList())
        ],
      ),
      bottomNavigationBar: const BottomBar(
        checkSelect: 1,
      ),
    );
  }
}
