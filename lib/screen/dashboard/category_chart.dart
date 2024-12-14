import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CategoryChart extends StatefulWidget {
  const CategoryChart({super.key});

  @override
  State<CategoryChart> createState() => _CategoryChartState();
}

// Data for the pie chart
Map<String, double> dataMap = {
  "Food & Drink": 5,
  "Transportation": 3,
  "Entertainment": 2,
  "Utilities": 2,
  "Health": 2,
  "Shopping": 2,
};

// Colors for the chart
final List<Color> colorList = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.red,
  Colors.yellow,
];

class _CategoryChartState extends State<CategoryChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Monthly Category Chart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF585858),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CalendarButton(),
        PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 1000),
          chartLegendSpacing: 32,
          chartRadius: MediaQuery.of(context).size.width / 2,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          legendOptions: const LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            showLegends: true,
            legendShape: BoxShape.rectangle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
        ),
      ],
    );
  }
}

class CalendarButton extends StatefulWidget {
  const CalendarButton({super.key});

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          margin: EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                const Text(
                  "Dec / 2024",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
