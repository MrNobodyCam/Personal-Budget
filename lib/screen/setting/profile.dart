import 'dart:math';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 29, left: 10, right: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Transform.rotate(
                  angle: pi,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Image.asset(
                      'assets/icon/arrow.png',
                      width: 30,
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 20,),
            const CircleAvatar(
              backgroundColor: Colors.black,
              radius: 53,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                backgroundImage: AssetImage("assets/user_data/Kao_Vichet.jpg"),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(left:  34,right: 141,top: 21),
              child: const Row(
                children: [
                  Text("Username",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text("Kao Vichet",style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left:  34,right: 40,top: 21),
              child: const Row(
                children: [
                  Text("Email",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text("kaovichet11@gmail.com",style: TextStyle(fontSize: 16)),
                ],
              ),
            ),Container(
              margin: const EdgeInsets.only(left:  34,right: 37,top: 21),
              child: const Row(
                children: [
                  Text("Address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text("Phnom Penh, Cambodia",style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left:  34,right: 173,top: 21),
              child: const Row(
                children: [
                  Text("Nickname",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text("Vichet",style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left:  34,right: 125,top: 21),
              child: const Row(
                children: [
                  Text("DOB",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text("05 Oct 2005",style: TextStyle(fontSize: 16)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
