import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/colors.dart';
import 'package:fruits/custom_category_item.dart';
import 'package:fruits/custom_product_card.dart';
import 'package:fruits/models/category_model.dart';
import 'package:fruits/models/product_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex= 0;
  final List<Widget> screens = [
    Center(child: Text("Home")),
    Center(child: Text("Wishlist")),
    Center(child: Text("Cart")),
    Center(child: Text("Profile")),
    Center(child: Text("Settings")),
  ];
  List<String> items =[
    'assets/banners/Slider 1.png',
    'assets/banners/Slider 2.png',
    'assets/banners/Slider 3.png',
  ];
  List<CategoryModel> category =[
    CategoryModel(
      name: 'fruits',
      image: 'assets/category/fruits.png'),
    CategoryModel(
      name: 'Milk & egg',
      image: 'assets/category/milk &egg.png'),
    CategoryModel(
      name: 'Beverages',
      image: 'assets/category/Beverages.png'),
    CategoryModel(
      name: 'Laundry',
      image: 'assets/category/lundary.png'),
    CategoryModel(
      name: 'Vegetables',
      image: 'assets/category/vegetables.png'),
  ];
  List<ProductModel> products =[
    ProductModel(
          name: 'Banana',
          image: 'assets/fruits/banana.png',
          rate: '4.8',
          rateCount: '(287)',
          price: r'$ ' '3.99',
          ),
    ProductModel(
          name: 'Pepper',
          image: 'assets/fruits/pepper.png',
          rate: '4.8',
          rateCount: '(287)',
          price: r'$ ' '2.99',
          ),
    ProductModel(
          name: 'Orange',
          image: 'assets/fruits/orange.png',
          rate: '4.8',
          rateCount: '(287)',
          price: r'$ ' '3.99',
          ),
  ];
  List basketList =[];
  void toogleSelection(ProductModel product){
     setState(() {
      if(basketList.contains(product)) {
        basketList.remove(product);
      } else {
        basketList.add(product);
      }
    });
  }
  bool isSelected (ProductModel product) => basketList.contains(product);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         leading: SizedBox.shrink(),
          leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset('assets/icons/Vector (1).svg'),
            const SizedBox(
              width: 10,
            ),
           const  Text(
              '61 Hopper street..',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
            Icon(Icons.keyboard_arrow_down_outlined , size: 34,),
           const  Spacer(),
            SvgPicture.asset('assets/icons/Vector (2).svg'),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: items.length,
             itemBuilder: (BuildContext context, int index, int realIndex) { 
              return Image.asset(items[index]);
              },
              options:CarouselOptions(
                height: 170,
                aspectRatio: 1,
                viewportFraction: .8,
                autoPlay: true,
                autoPlayInterval : Duration(seconds: 3),
               autoPlayAnimationDuration : Duration(seconds: 3),
               autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
              ),
             const SizedBox(
                height: 15,
              ),
          Row(
            children: 
              List.generate(category.length, (index){
                return  CustomCategoryItem(
                  image: category[index].image,
                  name: category[index].name,
                );
              }),
            
          ),
         const  SizedBox(
            height: 15,
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text(
                  'Fruits',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                  ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: primaryColor,
                  ),
                  ),
      
              ],
            ),
          ),
          const SizedBox(height: 7,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: 
                List.generate(products.length, (index){
                    final item = products[index];
                  return  CustomProductCard(
                    onTap: () {
                toogleSelection(item);
                
                    } ,
                    image: item.image,
                    name:item.name ,
                    rate: item.rate,
                    rateCount:item.rateCount ,
                    price: item.price,
                    icon: isSelected(item) ? Icon(Icons.check) : Icon(Icons.add),
                    
                  );
                }),
              
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: ListView.builder(
                        itemCount: basketList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context , index){
                          return Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(basketList[index].image),
                                  ),
                            )
                          );
                        }
                        ),
                    ),
                    Spacer(),
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.white,
                    ),
                 const    SizedBox(width: 10,),
                   const  Text('View Basket',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    ),
                    SizedBox(width: 10,),
                    Badge(
                      backgroundColor: Colors.red,
                      label: Text(basketList.length.toString(),style: TextStyle(fontSize: 13)),
                      child: SvgPicture.asset('assets/icons/Vector (2).svg',color: Colors.white,),
                      ),
                
                    
                  ],
                ),
              ),
            ),
          ),
          
        ]
            ),
          );
        
      
    
    
  }
}

        