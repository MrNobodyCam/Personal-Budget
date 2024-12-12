import 'package:flutter/material.dart';
import 'package:personal_budget/screen/notification_screen.dart';
import 'package:personal_budget/screen/setting/about.dart';
// import 'package:personal_budget/screen/setting/profile.dart';
// import 'package:personal_budget/screen/setting/setting_screen.dart';
// import 'package:personal_budget/screen/transaction/transaction_screen.dart';

class PersonalBudget extends StatefulWidget {
  const PersonalBudget({super.key});

  @override
  State<PersonalBudget> createState() => _PersonalBudgetState();
}

class _PersonalBudgetState extends State<PersonalBudget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Inter",
        ),
        home:const NotificationScreen());
  }
}
