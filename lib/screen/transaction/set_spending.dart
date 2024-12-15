import 'package:flutter/material.dart';

class SetSpending extends StatefulWidget {
  const SetSpending({super.key});

  @override
  State<SetSpending> createState() => _SetSpendingState();
}

class _SetSpendingState extends State<SetSpending> {
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
                            side: BorderSide(
                                color: Colors.black
                            )
                        )
                    ),
                  ),
                )
              ],
            ),
            Text(
              "Set Spending",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Amount",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: " Input Amount",
                prefixText: "  \$ "
              ),
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
