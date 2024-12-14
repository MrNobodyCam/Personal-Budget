import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseLineChart extends StatefulWidget {
  const ExpenseLineChart({super.key});

  @override
  State<ExpenseLineChart> createState() => _ExpenseLineChartState();
}

class _ExpenseLineChartState extends State<ExpenseLineChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Weekly Expense Line Chart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF585858),
          ),
        ),
        const SizedBox(height: 15),
        CalendarButton(),
        const SizedBox(height: 15),
        SizedBox(
          height: 300,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(1, 50), // Monday: $50
                    FlSpot(2, 30), // Tuesday: $30
                    FlSpot(3, 40), // Wednesday: $40
                    FlSpot(4, 60), // Thursday: $60
                    FlSpot(5, 20), // Friday: $20
                    FlSpot(6, 70), // Saturday: $70
                    FlSpot(7, 45), // Sunday: $45
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
              minY: 0,
              maxY: 100,
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
                  "14 / Dec / 2024",
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
