import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_budget/data/data.dart';
import 'package:personal_budget/screen/report/expense_item_report.dart';

class DataExportList extends StatefulWidget {
  const DataExportList({super.key});

  @override
  State<DataExportList> createState() => _DataExportListState();
}

class _DataExportListState extends State<DataExportList> {
  @override
  void initState() {
    print(expenseList.checkReport);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          expenseList.checkReportValue() != 0
              ? Expanded(
                  child: ListView.builder(
                    itemCount: expenseList.expenseList.length,
                    itemBuilder: (context, index) {
                      if (DateFormat('yMMMMd').format(
                              expenseList.expenseList[index].dateTime) ==
                          DateFormat('yMMMMd')
                              .format(expenseList.checkReport)) {
                        return ExpenseItem(
                          expense: expenseList.expenseList[index],
                          expenseIndex: index,
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                )
              : Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icon/empty.png",
                        width: 80,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("No matching expenses",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey)),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
