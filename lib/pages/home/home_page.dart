import 'package:coffeeappui/models/products.dart';
import 'package:coffeeappui/pages/details/products_details_page.dart';
import 'package:coffeeappui/util/products_title.dart';
import 'package:coffeeappui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndexBottomBar = 0;
  final _textController = TextEditingController();
  //list of coffe types
  final List coffeeType = [
    ['Cappuccino', true],
    ['Espresso', false],
    ['Latte', false],
    ['Milk Coffee', false],
    ['Tea', false]
  ];

  //product popular
  List productPopular = [
    Products(
        name: 'Cappuccino',
        imagePath: 'lib/assets/images/cappuccino/cappuccino.jpg',
        description:
            'A cappuccino is a coffee drink made from a mixture of espresso and steamed milk. A traditional Italian cappuccino is generally a single (or sometimes a double) espresso shot topped with equal parts steamed and frothed milk (in a ratio of 1:1:1). Many Americans have adapted this recipe, using more steamed and frothed milk for a milder espresso flavor and a richer taste.',
        price: '4.10',
        rating: '4.7'),
    Products(
        name: 'Espresso',
        imagePath: 'lib/assets/images/espresso/espresso.jpg',
        description:
            'Espresso is a concentrated form of coffee, served in shots, that is made by forcing pressurized hot water through very finely ground coffee beans. It is not a type of coffee bean or a roasting style. It has a layer of crema on top, which is formed by air bubbles and coffee oils. It can be the base of other coffee drinks, such as cappuccino, latte, americano and macchiato.',
        price: '4.00',
        rating: '4.9'),
    Products(
        name: 'Latte',
        imagePath: 'lib/assets/images/latte/latte.jpg',
        description:
            'A latte or caffè latte is a milk coffee that boasts a silky layer of foam as a real highlight to the drink. A true latte will be made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top. These elements combined result in a balanced milky coffee that possesses an aesthetically pleasing look and a smooth texture.',
        price: '4.20',
        rating: '4.8'),
    Products(
        name: 'Milk Coffee',
        imagePath: 'lib/assets/images/milk_coffee/milk-coffee.jpg',
        description:
            'A popular variation is milk ice coffee (or stone brown in the North), which is iced coffee served with sweetened condensed milk. This is done by putting two to three teaspoons or more of condensed milk into the cup prior to the drip filter process.',
        price: '4.00',
        rating: '4.5'),
    Products(
        name: 'Tea',
        imagePath: 'lib/assets/images/tea/tea.jpg',
        description:
            'Tea is an aromatic beverage prepared by pouring hot or boiling water over cured or fresh leaves of Camellia sinensis, an evergreen shrub native to East Asia which probably originated in the borderlands of southwestern China and northern Myanmar.',
        price: '4.00',
        rating: '4.0')
  ];

  //naviagte to product details page
  void naviagteToProductsDetails(int index) {
    Get.to(ProductsDetailsPage(
      product: productPopular[index],
    ));
  }

  //CoffeeTypeSelected
  void _coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  //SelectedBottomBar
  void _selectedBottomBar(int index) {
    setState(() {
      _selectedIndexBottomBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: const Drawer(
            // child: DrawerNavBar(),
            ),
        //AppBar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              // child: CircleAvatar(
              //   child: ClipOval(
              //     child: Image.asset('lib/images/users/avatar.jpg'),
              //   ),
              // ),
              child: Icon(Icons.person),
            )
          ],
        ),
        //BottomBar
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey[900],
            selectedItemColor: Colors.orange,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndexBottomBar,
            onTap: _selectedBottomBar,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Carts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Find the best coffee for you',
                style: GoogleFonts.bebasNeue(fontSize: 56.0),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    hintText: 'Search coffee...',
                    filled: true,
                    fillColor: Colors.grey[900],
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _textController.clear();
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey.shade600)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey.shade600))),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          _coffeeTypeSelected(index);
                        });
                  }),
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productPopular.length,
                    itemBuilder: (context, index) => ProductsTitle(
                          product: productPopular[index],
                          onTap: () => naviagteToProductsDetails(index),
                        )))
          ],
        ));
  }
}
