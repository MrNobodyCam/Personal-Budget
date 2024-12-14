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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.black,
          width: 2,
        )
      ),
      margin: const EdgeInsets.only(left: 13, right: 13, top: 30, bottom: 20),
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
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/category/soft-drink.png",
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
