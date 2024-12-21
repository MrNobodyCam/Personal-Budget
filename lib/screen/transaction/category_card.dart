import 'package:flutter/material.dart';
import 'package:personal_budget/data/data.dart';
import 'package:personal_budget/screen/transaction/transaction_screen.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.black,
            width: 2,
          )),
      margin: const EdgeInsets.only(left: 13, right: 13, top: 10, bottom: 10),
      color: const Color(0xFFF0F0F0),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            InkWell(
              onTap: () {
                print("All Item");
                expenseList.checkCategory = 1;
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TransactionScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/category/all.png",
                    width: 60,
                  ),
                  const Text(
                    "All Item",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  )
                ],
              ),
            ),
            const SizedBox(width: 25),
            InkWell(
              onTap: () {
                print("Soft Drink");
                expenseList.checkCategory = 2;
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TransactionScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/category/soft-drink.png",
                    width: 60,
                  ),
                  const Text(
                    "Food & Drink",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  )
                ],
              ),
            ),
            const SizedBox(width: 25),
            InkWell(
              onTap: () {
                print("Transportation");
                expenseList.checkCategory = 3;
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TransactionScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/category/vehicles.png",
                    width: 60,
                  ),
                  const Text(
                    "Transportation",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  )
                ],
              ),
            ),
            const SizedBox(width: 25),
            InkWell(
              onTap: () {
                print("Cinema");
                expenseList.checkCategory = 4;
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TransactionScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/category/cinema.png",
                    width: 60,
                  ),
                  const Text(
                    "Cinema",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  )
                ],
              ),
            ),
            const SizedBox(width: 25),
            InkWell(
              onTap: () {
                print("Utilities");
                expenseList.checkCategory = 5;
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TransactionScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/category/utility.png",
                    width: 60,
                  ),
                  const Text(
                    "Utilities",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  )
                ],
              ),
            ),
            const SizedBox(width: 25),
            InkWell(
              onTap: () {
                print("Health");
                expenseList.checkCategory = 6;
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TransactionScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/category/healthcare.png",
                    width: 60,
                  ),
                  const Text(
                    "Health",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  )
                ],
              ),
            ),
            const SizedBox(width: 25),
            InkWell(
              onTap: () {
                print("Shopping");
                expenseList.checkCategory = 7;
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TransactionScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/category/online-shopping.png",
                    width: 60,
                  ),
                  const Text(
                    "Shopping",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
