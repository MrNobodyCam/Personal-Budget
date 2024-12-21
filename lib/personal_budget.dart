import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:personal_budget/screen/start_page.dart';

class PersonalBudget extends StatefulWidget {
  const PersonalBudget({super.key});

  @override
  State<PersonalBudget> createState() => _PersonalBudgetState();
}

class _PersonalBudgetState extends State<PersonalBudget> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Inter",
        ),
        home:const StartPage());
  }
}
