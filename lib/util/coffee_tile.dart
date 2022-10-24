// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;
  final String coffeeDescription;

  CoffeeTile({
    required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeePrice,
    required this.coffeeDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.black54,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //coffee image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(coffeeImagePath),
              ),

              //coffee name
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(coffeeName, style: TextStyle(fontSize: 20)),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),

              //coffee description
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 8, top: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffeeDescription,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),

              //price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('₱' + coffeePrice),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
