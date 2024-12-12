import 'dart:math';
import 'package:flutter/material.dart';
import '../bottom_bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            // Offset for the fixed header
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. App Name and Purpose:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 App Name: Personal Budget Tracker",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 Description: A simple and intuitive tool to help users manage their finances, track expenses, and stay within budget.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "2. Key Features:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 Track income and expenses with ease.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 Set budgets and receive alerts for overspending.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 View detailed reports with charts and graphs.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 Export financial data as PDF for sharing or record-keeping.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 Responsive design and light/dark theme toggle.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "3. Developer Information:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 Name: Kao Vichet",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 Contact: kaovichet11@gmail.com",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 Social Links:",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "\u2022 LinkedIn: Vichet Kao",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "\u2022 GitHub: https://github.com/MrNobodyCam",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 20),
                  Text(
                    "4. App Version:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 Version: 1.0.0",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "5. Feedback and Support:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\u2022 For suggestions or issues, contact kaovichet11@gmail.com.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // Fixed header
        ],
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 18),
                    child: Transform.rotate(
                      angle: pi,
                      child: IconButton(
                        onPressed: () {
                          print("Arrow clicked");
                          // Navigator.pop(
                          //     context); // Go back to the previous screen
                        },
                        icon: Image.asset(
                          'assets/icon/arrow.png',
                          width: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Text(
                "About",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                // textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
