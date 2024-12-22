import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_budget/model/expense.dart';
import 'package:personal_budget/screen/transaction/transaction_screen.dart';
import 'package:personal_budget/data/data.dart';

import '../../local_notification.dart';

class EditExpense extends StatefulWidget {

  const EditExpense({super.key,required this.expense,required this.expenseIndex});
  final Expense expense;
  final int expenseIndex;

  @override
  State<EditExpense> createState() => _EditExpenseState();
}

class _EditExpenseState extends State<EditExpense> {
  late DateTime oldDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  late Categorys _selectCategory;
  late DateTime selectDate;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    oldDate = widget.expense.dateTime;
    _selectCategory = widget.expense.category;
    selectDate = widget.expense.dateTime;
    _titleController = TextEditingController(text: widget.expense.title);
    _descriptionController = TextEditingController(text: widget.expense.description);
    _amountController = TextEditingController(text: widget.expense.amount.toString());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _editExpense(Expense updatedExpense) {
    setState(() {
      // expenseList.updateExpense(widget.expenseIndex, updatedExpense);
      expenseList.expenseList.removeAt(widget.expenseIndex);
      expenseList.expenseList.insert(widget.expenseIndex, updatedExpense);
      // if(DateTime.now().month == updatedExpense.dateTime.month){
      //   sharedBalance.addExpense(updatedExpense.amount);
      // }
      sharedBalance.expenseValueEdit(expenseList);
    });
  }

  void onEdit() {
    if (_formKey.currentState!.validate()) {
      final updatedExpense = Expense(
        title: _titleController.text,
        description: _descriptionController.text,
        category: _selectCategory,
        amount: double.parse(_amountController.text),
        dateTime: selectDate,
      );

      _editExpense(updatedExpense);
      print(
          "Updated -> Title: ${updatedExpense.title}, Description: ${updatedExpense.description}, Category: ${updatedExpense.category}, Amount: ${updatedExpense.amount}, DateTime: ${updatedExpense.dateTime}");

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TransactionScreen(),
        ),
      );

      if (sharedBalance.overSpending()) {
        LocalNotification.showSimpleNotification(
          title: "Budget Alert!",
          body: "You’ve exceeded your budget.",
          payload: "payload",
        );
        expenseList.addOverSpend(updatedExpense);
      }
    }
  }

  void dateTimePick() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
      initialDate: selectDate,
    );

    if (date != null) {
      setState(() {
        selectDate = date;
      });
    }
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    ),
                  ],
                ),
                const Text(
                  "Edit Expense",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        maxLength: 25,
                        controller: _titleController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(labelText: "Title",),

                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please input title.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      // width: 20,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: DropdownButtonFormField<Categorys>(
                          value: _selectCategory,
                          items: Categorys.values.map((category) {
                            return DropdownMenuItem<Categorys>(
                              value: category,
                              child: Text(category.toString().split('.').last),
                            );
                          }).toList(),
                          onChanged: (Categorys? newValue) {
                            setState(() {
                              _selectCategory = newValue!;
                            });
                          },

                        ),
                      )
                    ),
                  ],
                ),
                TextFormField(
                  maxLength: 80,
                  controller: _descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Description"),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please provide a description.';
                    }
                    if (value.length > 80) {
                      return 'Description must not exceed 80 characters.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    InkWell(
                      onTap: dateTimePick,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${selectDate.day}/${selectDate.month}/${selectDate.year}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.calendar_month, size: 20),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 130,
                      child: TextFormField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                        ],
                        decoration: const InputDecoration(
                          label: Text("Amount"),
                          prefixText: "\$ ",
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please input amount.';
                          }
                          try {
                            double.parse(value);
                          } catch (_) {
                            return 'Please input number.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.only(right: 20, top: 30, bottom: 20),
      actions: <Widget>[
        ElevatedButton.icon(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 35)),
            backgroundColor: WidgetStateProperty.all(const Color(0xFF006CC5)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color(0xFF006CC5)),
              ),
            ),
          ),
          onPressed: onEdit,
          label: const Text(
            "Edit",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          icon: const Icon(
            Icons.edit,
            size: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
// ButtonStyle(
// padding: MaterialStateProperty.all(
// const EdgeInsets.symmetric(horizontal: 35)),
// backgroundColor: MaterialStateProperty.all(const Color(0xFF19BE00)),
// shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10),
// side: const BorderSide(color: Color(0xFF19BE00)),
// ),
// ),
// ),