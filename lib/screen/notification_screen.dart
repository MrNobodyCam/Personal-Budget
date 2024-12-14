import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          Header(),
          SizedBox(height: 25,),
          NotificationList(),
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
              margin: const EdgeInsets.only(left: 10,top: 8),
              child: Transform.rotate(
                angle: pi,
                child: IconButton(
                    onPressed: () {
                      print("Button Clicked");
                      Navigator.of(context).pop();
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
          Navigator.of(context).pop();
          Get.back;
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

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Text("07/Dec/2024",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        const NotificationItem(),
      ],
    );
  }
}
