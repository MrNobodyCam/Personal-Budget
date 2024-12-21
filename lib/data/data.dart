import 'package:personal_budget/model/expense.dart';

Expense expense1 = Expense(
  title: "School",
  description: "Hello School Expense",
  category: Categorys.Utilities,
  amount: 13.0,
);

Expense expense2 = Expense(
  title: "Hospital",
  description: "Hello Hospital Expense",
  category: Categorys.Health,
  amount: 13.0,
);

Balance sharedBalance = Balance();
ListExpense expenseList = ListExpense();