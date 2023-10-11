import 'package:coffeeappui/models/products.dart';
import 'package:flutter/material.dart';

class ProductsTitle extends StatelessWidget {
  final Products product;
  final void Function()? onTap;

  const ProductsTitle({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12.0),
          width: 200.0,
          decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20.0)),
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
            //image
            ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(product.imagePath)),
            //text
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '\$ ',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: product.price,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 15,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(product.rating),
                    ],
                  ),
                  // button add to cart
                  // Container(
                  //   // padding: EdgeInsets.all(4),
                  //   decoration: BoxDecoration(
                  //       color: Colors.orange,
                  //       borderRadius: BorderRadius.circular(6.0)),
                  //   child: const Icon(Icons.add),
                  // )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
