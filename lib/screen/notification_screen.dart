import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_budget/screen/app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(),
      body: ListView(
        children: const [
          Header(),
          SizedBox(height: 10,),
          NotificationItem(),
          NotificationItem(),
          NotificationItem(),
          NotificationItem(),
          NotificationItem(),
          NotificationItem(),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10,top: 18),
              child: Transform.rotate(
                angle: pi,
                child: IconButton(
                    onPressed: () {
                      print("Button Clicked");
                    },
                    icon: Image.asset(
                      "assets/icon/arrow.png",
                      width: 30,
                    )),
              ),
            ),
          ],
        ),
        const Text("Notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
      ],
    );
  }
}
class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
          color: Colors.black,
          width: 3.0,
        ),
      ),
      margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
      color: const Color(0xFFD9D9D9),
      child: InkWell(
        onTap: (){
          print("Clicked");
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset("assets/icon/warning.png",width: 61,),
              const SizedBox(width: 8,),
              const Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Overspending Detected!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Text("You've exceeded your budget for [Category Name]! You've spent [Spent Amount], surpassing your budget of [Budget Amount]. Please review your expenses.",style: TextStyle(fontSize: 12),),
                ],
              ))
            ],
          ),
        ),
      )
    );
  }
}
