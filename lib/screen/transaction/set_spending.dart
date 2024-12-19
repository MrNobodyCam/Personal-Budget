import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_budget/model/expense.dart';

class SetSpending extends StatefulWidget {
  final Balance valueBalance;

  const SetSpending({super.key, required this.valueBalance});

  @override
  State<SetSpending> createState() => _SetSpendingState();
}

class _SetSpendingState extends State<SetSpending> {
  final TextEditingController _balanceController = TextEditingController();

  void addBalance() {
    double balance = double.tryParse(_balanceController.text) ?? 0.0;
    widget.valueBalance.addBalance(balance);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFE9E9E9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Colors.black,
          width: 5,
        ),
      ),
      titlePadding: const EdgeInsets.only(left: 20, right: 20),
      insetPadding: const EdgeInsets.only(left: 18, right: 18),
      title: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      weight: 900,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Text(
              "Set Spending",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text(
              "Amount",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _balanceController,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: " Input Amount",
                prefixText: "  \$ ",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')), // Allow numbers and one decimal point
              ],
            ),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.only(right: 20, top: 30, bottom: 20),
      actions: <Widget>[
        ElevatedButton.icon(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 35)),
            backgroundColor:
            WidgetStateProperty.all(const Color(0xFF19BE00)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color(0xFF19BE00)),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              addBalance();
              Navigator.pop(context);
            });
          },
          label: const Text(
            "Add",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          icon: const Icon(
            Icons.add,
            size: 25,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
