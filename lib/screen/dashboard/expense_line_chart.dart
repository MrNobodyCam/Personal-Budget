import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:personal_budget/data/data.dart';

class ExpenseLineChart extends StatefulWidget {
  const ExpenseLineChart({super.key});

  @override
  State<ExpenseLineChart> createState() => _ExpenseLineChartState();
}

class _ExpenseLineChartState extends State<ExpenseLineChart> {
  double mon = 0;
  double tue = 0;
  double wed = 0;
  double thu = 0;
  double fri = 0;
  double sat = 0;
  double sun = 0;
  double minY = 0; // Initial minY value
  double maxY = 100;
  @override
  void initState() {
    super.initState();
    mon = expenseList.checkMon();
    tue = expenseList.checkTue();
    wed = expenseList.checkWed();
    thu = expenseList.checkThu();
    fri = expenseList.checkFri();
    sat = expenseList.checkSat();
    sun = expenseList.checkSun();
    List<double> expenses = [mon, tue, wed, thu, fri, sat, sun];
    minY = expenses.reduce((a, b) => a < b ? a : b); // Get the min value
    maxY = expenses.reduce((a, b) => a > b ? a : b); // Get the max value

    // Optionally add some padding to maxY for better visualization
    maxY += 10;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          "This Week Expense Line Chart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF585858),
          ),
        ),
        // const SizedBox(height: 15),
        // CalendarButton(),
        const SizedBox(height: 15),
        SizedBox(
          height: 300,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(1, mon), // Monday
                    FlSpot(2, tue), // Tuesday
                    FlSpot(3, wed), // Wednesday
                    FlSpot(4, thu), // Thursday
                    FlSpot(5, fri), // Friday
                    FlSpot(6, sat), // Saturday
                    FlSpot(7, sun), // Sunday
                  ],
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.orange,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.orange.withOpacity(0.2),
                  ),
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) =>
                        FlDotCirclePainter(
                      radius: 4,
                      color: Colors.orange,
                      strokeColor: Colors.black,
                      strokeWidth: 1.5,
                    ),
                  ),
                ),
              ],
              minY: minY, // Dynamic minY
              maxY: maxY,
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 1:
                          return const Text('Mon',
                              style: TextStyle(fontSize: 12));
                        case 2:
                          return const Text('Tue',
                              style: TextStyle(fontSize: 12));
                        case 3:
                          return const Text('Wed',
                              style: TextStyle(fontSize: 12));
                        case 4:
                          return const Text('Thu',
                              style: TextStyle(fontSize: 12));
                        case 5:
                          return const Text('Fri',
                              style: TextStyle(fontSize: 12));
                        case 6:
                          return const Text('Sat',
                              style: TextStyle(fontSize: 12));
                        case 7:
                          return const Text('Sun',
                              style: TextStyle(fontSize: 12));
                        default:
                          return const Text('');
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    getTitlesWidget: (value, meta) {
                      return Text('\$${value.toInt()}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ));
                    },
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                horizontalInterval: 10,
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(color: Colors.black, width: 1),
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

// class CalendarButton extends StatefulWidget {
//   const CalendarButton({super.key});
//
//   @override
//   State<CalendarButton> createState() => _CalendarButtonState();
// }

// class _CalendarButtonState extends State<CalendarButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Spacer(),
//         Container(
//           margin: EdgeInsets.only(right: 20),
//           child: InkWell(
//             onTap: () {},
//             child: Row(
//               children: [
//                 const Text(
//                   "14 / Dec / 2024",
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
