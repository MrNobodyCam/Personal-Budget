import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_budget/screen/dashboard/dashboard_screen.dart';
import 'package:personal_budget/screen/report/report_screen.dart';
import 'package:personal_budget/screen/setting/setting_screen.dart';
import 'package:personal_budget/screen/transaction/transaction_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, required this.checkSelect});
  final int checkSelect;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final List<String> icons = [
    "assets/icon/dashboard.png",
    "assets/icon/bill.png",
    "assets/icon/report.png",
    "assets/icon/setting.png",
  ];
  final List<String> selectedIcons = [
    "assets/icon/dashboard_selected.png",
    "assets/icon/bill_selected.png",
    "assets/icon/report_selected.png",
    "assets/icon/setting_selected.png",
  ];

  late int selectedIndex;
  final List<Widget> screens = [
    const DashboardScreen(),
    const TransactionScreen(),
    const ReportScreen(),
    const SettingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.checkSelect;
  }

  void _onItemTapped(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          screens[newIndex],
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ));
    // Get.offAll(
    //       () => screens[newIndex],
    //   transition: Transition.noTransition,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 25,
          ),
        ],
      ),
      child: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            return IconButton(
              icon: Image.asset(
                selectedIndex == index ? selectedIcons[index] : icons[index],
                width: 39,
              ),
              onPressed: () {
                _onItemTapped(index);
              },
            );
          }),
        ),
      ),
    );
  }
}
