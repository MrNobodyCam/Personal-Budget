import 'package:flutter/material.dart';

class DetailExpense extends StatefulWidget {
  const DetailExpense({super.key});

  @override
  State<DetailExpense> createState() => _DetailExpenseState();
}

class _DetailExpenseState extends State<DetailExpense> {
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
                Column(
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
                          "School Expense",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description :",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Amount",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ 2.5",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Category : ",
                  style:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Food & Drink",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 8,
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text(
                  "Date : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  "07/Dec/2024",
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
