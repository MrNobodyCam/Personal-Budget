import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 13, right: 13, top: 30, bottom: 20),
      color: const Color(0xFFF0F0F0),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () {
                print("Soft Drink");
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
          ],
        ),
      ),
    );
  }
}
