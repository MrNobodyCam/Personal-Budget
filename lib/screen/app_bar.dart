import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_budget/screen/notification_screen.dart';
import 'package:personal_budget/screen/setting/profile.dart';

// ignore: constant_identifier_names
enum Welcome { good_morning, good_afternoon, good_evening }

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    String getGreeting() {
      final hour = DateTime.now().hour;
      if (hour < 12 && hour > 5) {
        return "Good Morning";
      } else if (hour < 18 && hour > 12) {
        return "Good Afternoon";
      } else {
        return "Good Evening";
      }
    }

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
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(ProfileScreen(),transition: Transition.native,duration: Duration(milliseconds: 400));
                  },
                  child: const CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                      AssetImage("assets/user_data/Kao_Vichet.jpg"),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "${getGreeting()},Vichet",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                Get.to(NotificationScreen(),
                    transition: Transition.upToDown,
                    duration: Duration(milliseconds: 400));
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
