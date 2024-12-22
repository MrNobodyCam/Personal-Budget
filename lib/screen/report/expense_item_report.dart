import 'package:flutter/material.dart';
import 'package:personal_budget/model/expense.dart';
import 'package:personal_budget/screen/report/detail_expense_report.dart';

class ExpenseItem extends StatefulWidget {
  const ExpenseItem({super.key,required this.expense,required this.expenseIndex});
  final Expense expense;
  final int expenseIndex;

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  String asset = "assets/category/all.png";
  String checkCategory() {
    switch (widget.expense.category) {
      case Categorys.Food:
        asset = Categorys.Food.image;
        break;
      case Categorys.Transportation:
        asset = Categorys.Transportation.image;
        break;
      case Categorys.Entertainment:
        asset = Categorys.Entertainment.image;
        break;
      case Categorys.Utilities:
        asset = Categorys.Utilities.image;
        break;
      case Categorys.Health:
        asset = Categorys.Health.image;
        break;
      case Categorys.Shopping:
        asset = Categorys.Shopping.image;
        break;
    }
    return asset;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      color: Colors.white,
      margin: const EdgeInsets.only(left: 13, right: 13,bottom: 10),
      child: InkWell(
        onTap: (){
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => DetailExpense(
                expense: widget.expense,
                expenseIndex: widget.expenseIndex,
                // onRemoveExpense: ,
              ));
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Image.asset(
                checkCategory(),
                width: 50,
              ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.expense.title),
                  Text(
                      "${widget.expense.dateTime.day}/${widget.expense.dateTime.month}/${widget.expense.dateTime.year}"),
                ],
              ),
              Spacer(),
              Text("\$ ${widget.expense.amount.toStringAsFixed(2)}"),
            ],
          ),
        ),
      )
    );
  }
}
