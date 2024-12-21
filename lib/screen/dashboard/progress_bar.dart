import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:personal_budget/data/data.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double percentage = 0;
  Color color = Colors.green;
  @override
  void initState(){
    super.initState();
    percentage = sharedBalance.monthlyExpensePercentage(expenseList);
    if (percentage.isNaN) {
      percentage = 0;
    }
    if(percentage >= 0.9 && percentage < 1){
      color = Color(0xffebbe4d);
    }else if(percentage == 1){
      color = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "This Month Spending",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF585858)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 5,right: 5),
          child: GFProgressBar(
            percentage: percentage,
            lineHeight: 30,
            backgroundColor: Colors.black26,
            progressBarColor: color,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        sharedBalance.overSpending() ? Text(
          "You've exceeded your budget this month!",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ) : Text(
          "You've used ${(percentage*100).toStringAsFixed(2)}% of your budget this month!",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
