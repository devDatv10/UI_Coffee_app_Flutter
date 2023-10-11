import 'package:coffeeappui/components/button/button_cart.dart';
import 'package:coffeeappui/models/products.dart';
import 'package:coffeeappui/util/expandable_description.dart';
import 'package:coffeeappui/util/favorite_products.dart';
import 'package:coffeeappui/util/size_products.dart';
import 'package:flutter/material.dart';

class ProductsDetailsPage extends StatefulWidget {
  final Products product;
  const ProductsDetailsPage({super.key, required this.product});

  @override
  State<ProductsDetailsPage> createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  //quantity
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Column(children: [
        //listview product details
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: [
              //image
              Container(
                height: 360,
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(widget.product.imagePath, fit: BoxFit.cover,),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              //rating
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 23.0,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(widget.product.rating)
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //product name
                  Text(
                    widget.product.name,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  //add favorite product
                  FavoriteProducts()
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              //descriptions
              Text(
                'Description :',
                style: TextStyle(color: Colors.grey[300], fontSize: 16.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              ExpandableDescription(
                  initialDescription: widget.product.description),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Size', style: TextStyle(fontSize: 16.0)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizeProducts(
                        titleSize: 'S',
                      ),
                      SizeProducts(
                        titleSize: 'M',
                      ),
                      SizeProducts(
                        titleSize: 'L',
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )),
        Container(
          padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
          //price + quantity
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Price',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('Quantity', style: TextStyle(fontSize: 15))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '\$ ',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: widget.product.price,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey[900], shape: BoxShape.circle),
                        child: Center(
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(
                              Icons.remove,
                              size: 15,
                            ),
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      //quantity + count
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            quantityCount.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey[900], shape: BoxShape.circle),
                        child: Center(
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(
                              Icons.add,
                              size: 15,
                            ),
                            color: Colors.orange,
                          ),
                        ),
                      )
                    ],
                  )
                  //quantity
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //add to cart
              ButtonCart(text: 'Add to Cart', onTap: addToCart)
            ],
          ),
        )
      ]),
    );
  }
}
