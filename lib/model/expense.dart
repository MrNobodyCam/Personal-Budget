import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Categorys {
  Food(image: "assets/category/soft-drink.png", title: "Food & Drink"),
  Transportation(
      image: "assets/category/vehicles.png", title: "Transportation"),
  Entertainment(image: "assets/category/cinema.png", title: "Entertainment"),
  Utilities(image: "assets/category/utility.png", title: "Utilities"),
  Health(image: "assets/category/healthcare.png", title: "Health"),
  Shopping(image: "assets/category/online-shopping.png", title: "Shopping");

  final String image;
  final String title;
  const Categorys({required this.image, required this.title});
}

const uuid = Uuid();

class Balance {
  ValueNotifier<double> balanceNotifier = ValueNotifier<double>(0.00);
  ValueNotifier<double> expenseNotifier = ValueNotifier<double>(0.00);

  void addBalance(double newBalance) {
    balanceNotifier.value = newBalance;
  }

  void addExpense(double newBalance) {
    expenseNotifier.value = newBalance;
  }

  void removeExpense(Expense expense) {
    expenseNotifier.value = expenseNotifier.value - expense.amount;
  }

  void expenseValue(ListExpense listExpense) {
    for (var expense in listExpense.expenseList) {
      if (DateTime.now().month == expense.dateTime.month) {
        expenseNotifier.value = expenseNotifier.value + expense.amount;
      }
    }
    // expenseNotifier.value = newExpense + expenseNotifier.value;
  }

  bool overSpending() {
    if (expenseNotifier.value > balanceNotifier.value) {
      return true;
    }
    return false;
  }

  double monthlyExpensePercentage(ListExpense listExpense) {
    int nowMonth = DateTime.now().month;
    double sumAmountThisMonth = 0;
    for (Expense expenseIndex in listExpense.expenseList) {
      if (expenseIndex.dateTime.month == nowMonth) {
        sumAmountThisMonth += expenseIndex.amount;
      }
    }
    double percentage = sumAmountThisMonth / balanceNotifier.value;
    if (percentage > 1) {
      percentage = 1;
    }
    return percentage;
  }
}

class Expense {
  String id;
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
  })  : dateTime = dateTime ?? DateTime.now(),
        id = uuid.v4();
}

class ListExpense {
  List<Expense> expenseList = [];
  List<Expense> overSpending = [];
  int checkCategory = 1;
  // ListExpense(this.expenseList);
  void addExpense(Expense newExpense) {
    expenseList.add(newExpense);
    print(expenseList.length);
  }

  void addOverSpend(Expense newExpense) {
    overSpending.add(newExpense);
    print(overSpending.length);
  }

  void removeExpense(int index) {
    expenseList.removeAt(index);
    print(expenseList.length);
  }

  void removeOverSpend(int index) {
    overSpending.removeAt(index);
  }

  // double countByCategory(Categorys category) {
  //   return expenseList.where((expense) => expense.category == category){
  //
  //   };
  // }
  double amountByCategory(Categorys category) {
    double totalAmount = 0;
    for (var expense in expenseList) {
      if (expense.category == category &&
          DateTime.now().month == expense.dateTime.month) {
        totalAmount += expense.amount;
      }
    }
    return totalAmount;
  }

  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  double checkMon() {
    return _calculateSumForDay(0);
  }

  double checkTue() {
    return _calculateSumForDay(1);
  }

  double checkWed() {
    return _calculateSumForDay(2);
  }

  double checkThu() {
    return _calculateSumForDay(3);
  }

  double checkFri() {
    return _calculateSumForDay(4);
  }

  double checkSat() {
    return _calculateSumForDay(5);
  }

  double checkSun() {
    return _calculateSumForDay(6);
  }

  double _calculateSumForDay(int dayIndex) {
    // String nowDate = DateFormat('EEEE').format(DateTime.now());
    DateTime today = DateTime.now();
    DateTime startDate = today.subtract(Duration(days: today.weekday - (dayIndex) % 7));
    DateTime endDate = startDate.add(Duration(days: 1)).subtract(Duration(milliseconds: 1));
    print("Start Date: ${startDate.toIso8601String()}");
    print("End Date: ${endDate.toIso8601String()}");
    double sumAmount = 0;
    for (var expense in expenseList) {
      if (expense.dateTime.isAfter(startDate.subtract(Duration(days: 1))) &&
          expense.dateTime.isBefore(endDate.add(Duration(days: 1)))) {
        if (DateFormat('EEEE').format(expense.dateTime) == days[dayIndex]) {
          sumAmount += expense.amount;
        }
      }
    }
    // for (var expense in expenseList) {
    //   if (expense.dateTime.isAfter(startDate) &&
    //       expense.dateTime.isBefore(endDate)) {
    //     if (DateFormat('EEEE').format(expense.dateTime) == days[dayIndex]) {
    //       sumAmount += expense.amount;
    //     }
    //   }
    // }
    // if (nowDate == days[dayIndex]) {
    //   print("Start Date: ${startDate.toIso8601String()}");
    //   print("End Date: ${endDate.toIso8601String()}");
    //
    //   for (var expense in expenseList) {
    //     if (expense.dateTime.isAfter(startDate) &&
    //         expense.dateTime.isBefore(endDate)) {
    //       if(DateFormat('EEEE').format(expense.dateTime) == days[dayIndex]){
    //         sumAmount += expense.amount;
    //       }
    //     }
    //   }
    // }

    return sumAmount;
  }
  // double checkSun(){
  //   var nowDate = DateFormat('EEEE').format(DateTime.now());
  //   int startDate = 0;
  //   int endDate = 0;
  //   double sumSatAmount = 0;
  //   if(nowDate == day[6]){
  //     startDate = DateTime.now().day - 6;
  //     endDate = DateTime.now().day + 0;
  //     print("Start Date: $startDate");
  //     print("End Date: $endDate");
  //     for(var expenseIndex in expenseList){
  //       if(expenseIndex.dateTime.day >= startDate && expenseIndex.dateTime.day <= endDate){
  //         sumSatAmount += expenseIndex.amount;
  //       }
  //     }
  //   }
  //   return sumSatAmount;
  // }
}
