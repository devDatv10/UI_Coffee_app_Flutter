import 'package:flutter/material.dart';

class CoffeeTitle extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeeDescription;
  final String coffeePrice;

  const CoffeeTitle(
      {super.key,
      required this.coffeeImagePath,
      required this.coffeeName,
      required this.coffeeDescription,
      required this.coffeePrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        width: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //coffee image
            ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(coffeeImagePath)),
            //coffee name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style:
                        const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    coffeeDescription,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            //price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$$coffeePrice',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    // padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6.0)),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
