import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const GridItem({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            image,
            width: double.infinity,
            height: 0.6 * MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text(
            price,
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}