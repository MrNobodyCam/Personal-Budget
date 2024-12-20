import 'package:flutter/material.dart';

enum Categorys {
  Food(image: "assets/category/soft-drink.png",title: "Food & Drink"),
  Transportation(image: "assets/category/vehicles.png",title: "Transportation"),
  Entertainment(image: "assets/category/cinema.png",title: "Entertainment"),
  Utilities(image: "assets/category/utility.png",title: "Utilities"),
  Health(image: "assets/category/healthcare.png",title: "Health"),
  Shopping(image: "assets/category/online-shopping.png",title: "Shopping");
  final String image;
  final String title;
  const Categorys({required this.image,required this.title});
}

class Balance {
  ValueNotifier<double> balanceNotifier = ValueNotifier<double>(0.00);
  ValueNotifier<double> expenseNotifier = ValueNotifier<double>(0.00);

  void addBalance(double newBalance) {
    balanceNotifier.value = newBalance;
  }
  void addExpense(double newBalance) {
    expenseNotifier.value = newBalance;
  }
  void removeExpense(Expense expense){
    expenseNotifier.value = expenseNotifier.value - expense.amount;
  }
  void expenseValue(ListExpense listExpense) {
    for(var expense in listExpense.expenseList){
      expenseNotifier.value = expenseNotifier.value + expense.amount;
    }
    // expenseNotifier.value = newExpense + expenseNotifier.value;

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
  int checkCategory = 1;
  // ListExpense(this.expenseList);
  void addExpense(Expense newExpense) {
    expenseList.add(newExpense);
    print(expenseList.length);
  }
  void removeExpense(int index) {
    expenseList.removeAt(index);
    print(expenseList.length);
  }
}