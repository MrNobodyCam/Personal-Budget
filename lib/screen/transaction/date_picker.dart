import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 2,
            )
        ),
        child: Row(
          children: [
            Text(
              "Pick A Date",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(width: 10,),
            Icon(Icons.calendar_month,),
          ],
        ),
      ),
    );
  }
}
