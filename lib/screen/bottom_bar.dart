import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
          children: [
            IconButton(
              icon: Image.asset(
                "assets/icon/dashboard.png",
                width: 39,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Image.asset(
                "assets/icon/bill.png",
                width: 39,
              ),
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Image.asset(
                "assets/icon/report.png",
                width: 39,
              ),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Image.asset(
                "assets/icon/setting.png",
                width: 39,
              ),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
