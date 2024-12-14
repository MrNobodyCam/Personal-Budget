import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today Spending",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF585858)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 5,right: 5),
          child: GFProgressBar(
            percentage: 0.6,
            lineHeight: 30,
            backgroundColor: Colors.black26,
            progressBarColor: Colors.green,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "You've spent 60% of your budget today!",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
