import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:personal_budget/model/expense.dart';
import '../../data/data.dart';

class CategoryChart extends StatefulWidget {
  const CategoryChart({super.key});

  @override
  State<CategoryChart> createState() => _CategoryChartState();
}

class _CategoryChartState extends State<CategoryChart> {
  late Map<String, double> dataMap;

  final List<Color> colorList = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.yellow,
  ];

  @override
  void initState() {
    super.initState();
    final foodCount = expenseList.amountByCategory(Categorys.Food);
    final transportationCount =
        expenseList.amountByCategory(Categorys.Transportation);
    final entertainmentCount =
        expenseList.amountByCategory(Categorys.Entertainment);
    final utilitiesCount = expenseList.amountByCategory(Categorys.Utilities);
    final healthCount = expenseList.amountByCategory(Categorys.Health);
    final shoppingCount = expenseList.amountByCategory(Categorys.Shopping);
    dataMap = {
      "Food & Drink": foodCount,
      "Transportation": transportationCount,
      "Entertainment": entertainmentCount,
      "Utilities": utilitiesCount,
      "Health": healthCount,
      "Shopping": shoppingCount,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text(
          "Monthly Spending Chart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF585858),
          ),
        ),
        const SizedBox(height: 15),
        const CalendarButton(),
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
            legendTextStyle: TextStyle(fontWeight: FontWeight.bold),
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
          margin: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () {
              // Implement date picker functionality here
              print("Date picker tapped");
            },
            child: const Text(
              "Dec / 2024",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
