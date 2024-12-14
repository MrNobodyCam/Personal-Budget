import 'package:flutter/material.dart';
import 'package:personal_budget/screen/report/expense_item.dart';

class DataExportList extends StatefulWidget {
  const DataExportList({super.key});

  @override
  State<DataExportList> createState() => _DataExportListState();
}

class _DataExportListState extends State<DataExportList> {
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
      margin: const EdgeInsets.only(left: 18, right: 18,bottom: 20),
      padding: const EdgeInsets.only(bottom: 10,top: 10),
      child: Column(
        children: [
          Text("08.Dec.2024",textAlign: TextAlign.center, style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView(
              children: [
                ExpenseItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
