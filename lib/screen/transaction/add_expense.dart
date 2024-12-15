import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_budget/screen/transaction/date_picker.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
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
      titlePadding: EdgeInsets.only(left: 20, right: 20),
      insetPadding: EdgeInsets.only(left: 18, right: 18),
      title: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20,),
            Text(
              "Add Expense",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 165,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text("Title",style: TextStyle(fontSize: 16),),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 143,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text("Title",style: TextStyle(fontSize: 16),),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text("Description",style: TextStyle(fontSize: 16),),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                DatePicker(),
                Spacer(),
                SizedBox(
                  width: 130,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      label: Text("Amount",style: TextStyle(fontSize: 16),),
                      prefixText: "\$ "
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.only(right: 20, top: 30, bottom: 20),
      actions: <Widget>[
        ElevatedButton.icon(
          style: ButtonStyle(
              padding:
              WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 35)),
              backgroundColor: WidgetStatePropertyAll(Color(0xFFC30000)),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Color(0xFFC30000))))),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(
            "Close",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          icon: Icon(
            Icons.close,
            size: 25,
            color: Colors.white,
          ),
        ),
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
            "Add",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          icon: Icon(
            Icons.add,
            size: 25,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
