import 'package:flutter/material.dart';
import 'package:personal_budget/model/expense.dart';
import 'package:personal_budget/screen/report/report_screen.dart';
import 'package:personal_budget/data/data.dart';

class DetailExpense extends StatefulWidget {
  const DetailExpense({
    super.key,
    required this.expense,
    required this.expenseIndex,
    // required this.onRemoveExpense
  });
  final Expense expense;
  final int expenseIndex;
  // final Function(Expense) onRemoveExpense;

  @override
  State<DetailExpense> createState() => _DetailExpenseState();
}

class _DetailExpenseState extends State<DetailExpense> {
  void removeExpense(int index) {
    setState(() {
      if(DateTime.now().month == expenseList.expenseList[index].dateTime.month){
        sharedBalance.removeExpense(widget.expense);
      }
      expenseList.removeExpense(index);
    });
    // initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFE9E9E9),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.black,
            width: 5,
          )),
      titlePadding: EdgeInsets.only(left: 18, right: 18),
      insetPadding: EdgeInsets.only(left: 18, right: 18),
      title: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      weight: 900,
                    ),
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.black))),
                  ),
                )
              ],
            ),
            Text(
              "Expense Detail",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 190,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Title : ",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.expense.title,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Description :",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.expense.description}",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 90,
                  child: Column(
                    children: [
                      Text(
                        "Amount",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$ ${widget.expense.amount.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Category : ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.expense.category.title,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 8,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Date : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  "${widget.expense.dateTime.day}/${widget.expense.dateTime.month}/${widget.expense.dateTime.year}",
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
      actions: <Widget>[
        ElevatedButton.icon(
            style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 35)),
                backgroundColor: WidgetStatePropertyAll(Color(0xFFC30000)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color(0xFFC30000))))),
            onPressed: () {
              setState(() {
                removeExpense(widget.expenseIndex);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => ReportScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              });
            },
            label: Text(
              "Delete",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            icon: Icon(
              Icons.delete,
              size: 18,
              color: Colors.white,
            )),
        ElevatedButton.icon(
          style: ButtonStyle(
              padding:
                  WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 35)),
              backgroundColor: WidgetStatePropertyAll(Color(0xFF19BE00)),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Color(0xFF19BE00))))),
          onPressed: () {},
          label: Text(
            "Edit",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          icon: Image.asset(
            "assets/icon/edit.png",
            width: 18,
          ),
        ),
      ],
    );
  }
}
