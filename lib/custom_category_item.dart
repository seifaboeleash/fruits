import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits/models/category_model.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade100,
            ),
            child: Image.asset(
              image,
              width: 60,
              ),
              
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold
          ),),
        ],
      ),
    );
  }
}