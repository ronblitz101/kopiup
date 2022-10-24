// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kopiup/util/coffee_tile.dart';
import 'package:kopiup/util/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeType = [
    // [ coffee type, isSelected ]
    [
      'All',
      true,
    ],
    [
      'Cappuccino',
      false,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Frappe',
      false,
    ],
    [
      'Tea',
      false,
    ],
    [
      'Special Drinks',
      false,
    ],
  ];

  // user tapped on coffee types

  void coffeeTypeSelected(int index) {
    setState(() {
      // this for loop makes every selection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.shopping_bag_rounded),
        centerTitle: true,
        title: Text(
          "KOPI UP",
          style:
              GoogleFonts.bebasNeue(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.transparent,
            tabBackgroundColor: Colors.orangeAccent,
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.favorite_border, text: 'Favorites'),
              GButton(icon: Icons.notifications, text: 'Notification'),
              GButton(icon: Icons.settings_outlined, text: 'Settings'),
            ],
            padding: EdgeInsets.all(16),
          ),
        ),
      ),
      body: Column(
        children: [
          // Front Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Text(
              "Up for a coffee...?",
              style: GoogleFonts.bebasNeue(
                fontSize: 80,
              ),
            ),
          ),

          SizedBox(height: 25),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Coffee...Tea...or Me?',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          SizedBox(height: 25),

          //horizontal listview of coffee types
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
                      coffeeTypeSelected(index);
                    });
              },
            ),
          ),

          // horizontal listview of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images1/cappuccino.jpg',
                  coffeeName: 'Cappuccino',
                  coffeeDescription: 'Vegan-Friendly',
                  coffeePrice: '199.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images1/tea.jpg',
                  coffeeName: 'Earl Grey Tea',
                  coffeeDescription: '',
                  coffeePrice: '109.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images1/milk.jpg',
                  coffeeName: 'Iced Milky Coffee',
                  coffeeDescription: 'With Brown Sugar Syrup',
                  coffeePrice: '219.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images1/latte.jpg',
                  coffeeName: 'Latte',
                  coffeeDescription: 'With Almold Milk',
                  coffeePrice: '149.00',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
