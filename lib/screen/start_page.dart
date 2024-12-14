import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_budget/screen/dashboard/dashboard_screen.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // Background for animation
            child: Lottie.asset(
              "assets/lottie/Animation - 1734180465451.json",
              width: 380,
              height: 380,
              repeat: true,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Welcome to FinTrack",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0003A8),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            child: const Text(
              "Your trusted companion for managing income, expenses, and budgets. "
              "Take control of your finances effortlessly and achieve your financial goals!",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 45),
          SizedBox(
            width: 265,
            height: 40,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6161),
              ),
              onPressed: () {
                Get.to(DashboardScreen(),
                    transition: Transition.upToDown,
                    duration: Duration(seconds: 1));
              },
              icon: Image.asset(
                "assets/icon/right-arrow.png",
                width: 18,
              ),
              label: const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
