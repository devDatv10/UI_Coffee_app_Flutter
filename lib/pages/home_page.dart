import 'package:coffeeappui/util/coffee_title.dart';
import 'package:coffeeappui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
    ['Latte', false],
    ['Espresso', false],
    ['Milk Coffee', false],
    ['Tea', false]
  ];

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
        backgroundColor: Colors.grey[900],
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Center(child: Text('C O F F E E', style: GoogleFonts.bebasNeue(fontSize: 50.0),))),
              //list Drawer
              // ListTile(
              //   onTap: (){},
              //   leading: Icon(Icons.home),
              //   title: Text('PAGE 1'),
              // )
              ],
          )
        ),
        //AppBar
        appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0,
          backgroundColor: Colors.transparent,
          // leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                // height: 40.0,
                // width: 40.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('lib/images/avatar.jpg'),
                ),
              ),
              // child: Icon(Icons.person),
            )
          ],
        ),
        //BottomBar
        bottomNavigationBar: BottomNavigationBar(
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
                icon: Icon(Icons.shopping_bag),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification',
              )
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
                    hintText: 'Find Your Coffee...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _textController.clear();
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.grey.shade600)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
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
            //listview coffee title
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTitle(
                  coffeeImagePath: 'lib/images/cappuccino.jpg',
                  coffeeName: 'Cappuccino',
                  coffeeDescription: 'With Oat Milk',
                  coffeePrice: '4.10',
                ),
                CoffeeTitle(
                  coffeeImagePath: 'lib/images/latte.jpg',
                  coffeeName: 'Latte',
                  coffeeDescription: 'With Chocolate',
                  coffeePrice: '4.20',
                ),
                CoffeeTitle(
                  coffeeImagePath: 'lib/images/espresso.jpg',
                  coffeeName: 'Espresso',
                  coffeeDescription: 'With a full-flavored',
                  coffeePrice: '4.00',
                ),
                CoffeeTitle(
                  coffeeImagePath: 'lib/images/milk-coffee.jpg',
                  coffeeName: 'Milk Coffee',
                  coffeeDescription: 'With Coffee and Milk',
                  coffeePrice: '4.00',
                ),
                CoffeeTitle(
                  coffeeImagePath: 'lib/images/tea.jpg',
                  coffeeName: 'Tea',
                  coffeeDescription: 'With Tea and hot Water',
                  coffeePrice: '4.00',
                ),
              ],
            ))
          ],
        ));
  }
}
