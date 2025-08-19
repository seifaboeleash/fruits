import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.name, required this.image, required this.rate, required this.rateCount, required this.price, required this.onTap, required this.icon});
  final String name;
  final String image;
  final String rate;
  final String rateCount;
  final String price;
  final Function() onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                  
                ),
                padding: EdgeInsets.all(10),
                child: Image.asset(image, width: 145,),
              ),
               Positioned(
                bottom: 4,
                right: 5,
                child: GestureDetector(
                  onTap: onTap,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: icon
                    ),
                ),
                )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                name,
          style:const  TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox( height: 5,),
           Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/star.png'
                , width: 25,),
               Text(
                '$rate ($rateCount)' ,
                 style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal
              ),),

            ],
          ),
          const SizedBox(
            height: 10,
          ),
               Text( price, style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
            ],
          )
        ],
      ),
    );
  }
}