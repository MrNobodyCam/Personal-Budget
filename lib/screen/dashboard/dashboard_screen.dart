import 'package:flutter/material.dart';
import 'package:personal_budget/screen/app_bar.dart';
import 'package:personal_budget/screen/bottom_bar.dart';
import 'package:personal_budget/screen/dashboard/category_chart.dart';
import 'package:personal_budget/screen/dashboard/expense_line_chart.dart';
import 'package:personal_budget/screen/dashboard/progress_bar.dart';

import '../../data/data.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState(){
    super.initState();
    expenseList.checkCategory = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: const [
            SizedBox(height: 20,),
            ProgressBar(),
            CategoryChart(),
            ExpenseLineChart(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(checkSelect: 0,),
    );
  }
}
