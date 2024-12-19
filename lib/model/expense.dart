import 'package:flutter/material.dart';

enum Categorys {
  Food(image: "assets/category/soft-drink.png"),
  Transportation(image: "assets/category/vehicles.png"),
  Entertainment(image: "assets/category/cinema.png"),
  Utilities(image: "assets/category/utility.png"),
  Health(image: "assets/category/healthcare.png"),
  Shopping(image: "assets/category/online-shopping.png");
  final String image;
  const Categorys({required this.image});
}

class Balance {
  ValueNotifier<double> balanceNotifier = ValueNotifier<double>(0.00);
  ValueNotifier<double> expenseNotifier = ValueNotifier<double>(0.00);

  void addBalance(double newBalance) {
    balanceNotifier.value = newBalance;
  }
  void addExpense(double newExpense) {
    expenseNotifier.value = newExpense + expenseNotifier.value;
  }
}

class Expense {
  String title;
  String? description;
  Categorys category;
  DateTime dateTime;
  double amount;

  Expense({
    required this.title,
    required this.category,
    required this.amount,
    this.description,
    DateTime? dateTime,
  }) : dateTime = dateTime ?? DateTime.now();
}

class ListExpense {
  List<Expense> expenseList = [];
  ListExpense(this.expenseList);
  void addExpense(Expense newExpense) {
    expenseList.add(newExpense);
    print(expenseList.length);
  }
  void removeExpense(int index) {
    expenseList.removeAt(index);
    print(expenseList.length);
  }
}
