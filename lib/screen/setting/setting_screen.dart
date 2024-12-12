import 'package:flutter/material.dart';
import '../app_bar.dart';
import '../bottom_bar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
      bottomNavigationBar: BottomBar(),
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
        print("Clicked");
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
