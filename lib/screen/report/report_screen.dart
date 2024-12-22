import 'package:flutter/material.dart';
import 'package:personal_budget/screen/app_bar.dart';
import 'package:personal_budget/screen/bottom_bar.dart';
import '../../data/data.dart';
import 'expense_list_report.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
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
      body: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          Text(
            "Report Generator",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          ),
          CalendarButton(),
          Expanded(child: DataExportList(),)
        ],
      ),
      bottomNavigationBar: const BottomBar(checkSelect: 2,),
    );
  }
}

class CalendarButton extends StatefulWidget {
  const CalendarButton({super.key});

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  final DateTime _selectedDate = expenseList.checkReport;
  @override
  void initState() {
    super.initState();
    print(expenseList.checkReport);
  }
  void dateTimePick() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime.now(),
      initialDate: _selectedDate,
    );

    if (date != null) {
      setState(() {
        expenseList.checkReport = date;
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => ReportScreen(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(top: 15, right: 10, bottom: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                "${expenseList.checkReport.day}/${expenseList.checkReport.month}/${expenseList.checkReport.year}",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      dateTimePick();
                    });
                  },
                  icon: const Icon(
                    Icons.calendar_month,
                    size: 30,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
