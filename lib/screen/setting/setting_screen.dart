import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_budget/screen/setting/about.dart';
import 'package:personal_budget/screen/setting/profile.dart';
import '../../data/data.dart';
import '../app_bar.dart';
import '../bottom_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState(){
    super.initState();
    expenseList.checkCategory = 1;
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBar(),
      body: Column(
        children: [
          SizedBox(
            height: 17,
          ),
          Text(
            "Setting",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 23,
          ),
          OptionCard(
            title: "User Profile",
          ),
          SizedBox(
            height: 30,
          ),
          OptionCard(
            title: "About Section",
          )
        ],
      ),
      bottomNavigationBar: BottomBar(checkSelect: 3,),
    );
  }
}

class OptionCard extends StatefulWidget {
  const OptionCard({super.key, required this.title});
  final String title;
  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    String image = "assets/icon/user.png";
    if (widget.title == "User Profile") {
      image = "assets/icon/user.png";
    } else if (widget.title == "About Section") {
      image = "assets/icon/info.png";
    }
    return GestureDetector(
      onTap: () {
        if (widget.title == "User Profile") {
          Get.to(ProfileScreen(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 300));
        } else if (widget.title == "About Section") {
          Get.to(AboutScreen(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 300));
        }
      },
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        color: Colors.white,
        margin: const EdgeInsets.only(left: 13, right: 13),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(width: 13),
              Text(
                widget.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Spacer(),
              Image.asset(
                "assets/icon/arrow.png",
                width: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
