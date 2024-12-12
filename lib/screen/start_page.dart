import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/icon/start_icon.png",
          width: 427,
        ),
        const Text(
          "Welcome to FinTrack",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0003A8),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
            margin: const EdgeInsets.only(left: 35, right: 35),
            child: const Center(
              child: Text(
                "Your trusted companion for managing income, expenses, and budgets. Take control of your finances effortlessly and achieve your financial goals!",
                textAlign: TextAlign.center,
              ),
            )),
        const SizedBox(
          height: 45,
        ),
        SizedBox(
          width: 265,
          height: 40,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6161)),
            onPressed: () {},
            icon: Image.asset(
              "assets/icon/right-arrow.png",
              width: 18,
            ),
            label: const Text(
              "Get Started",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            iconAlignment: IconAlignment.end,
          ),
        ),
      ],
    );
  }
}
