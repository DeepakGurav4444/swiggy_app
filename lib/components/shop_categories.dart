import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShopCategories extends StatefulWidget {
  @override
  _ShopCategoriesState createState() => _ShopCategoriesState();
}

class _ShopCategoriesState extends State<ShopCategories> {
  List<Image> placeHolders = [
    Image.asset("assets/images/holder1.png"),
    Image.asset("assets/images/holder2.png"),
    Image.asset("assets/images/holder3.png"),
    Image.asset("assets/images/holder4.png"),
    Image.asset("assets/images/holder5.png"),
    Image.asset("assets/images/holder6.png"),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          shopCategoryList(
              "https://evening-reef-45102.herokuapp.com/uploads/shop_categories/anything.jpg",
              "Anything Delivered",
              0,
              10,
              0,
              5,
              10),
          shopCategoryList(
              "https://evening-reef-45102.herokuapp.com/uploads/shop_categories/scootsy.jpg",
              "Scootsy",
              1,
              5,
              0,
              10,
              10),
          shopCategoryList(
              "https://evening-reef-45102.herokuapp.com/uploads/shop_categories/health.jpg",
              "Health Hub",
              2,
              5,
              0,
              5,
              10),
          shopCategoryList(
              "https://evening-reef-45102.herokuapp.com/uploads/shop_categories/meet.jpg",
              "Meat Stores",
              3,
              5,
              0,
              7,
              10),
          shopCategoryList(
              "https://evening-reef-45102.herokuapp.com/uploads/shop_categories/pet.jpg",
              "Pet Care Stores",
              4,
              5,
              0,
              5,
              10),
          shopCategoryList(
              "https://evening-reef-45102.herokuapp.com/uploads/shop_categories/fruits.jpg",
              "Fruits & Vegetable",
              5,
              5,
              0,
              15,
              10),
        ],
      ),
    );
  }

  Widget shopCategoryList(String url, String shopTitle, int placeholder,
      double pl, double pt, double pr, double pb) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        radius: MediaQuery.of(context).size.width * 0.5,
        splashColor: Colors.grey[75],
        child: Padding(
          padding: EdgeInsets.fromLTRB(pl, pt, pr, pb),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.215,
            height: MediaQuery.of(context).size.width * 0.35,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned.fill(
                  child: Column(children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        alignment: Alignment.center,
                        imageUrl: url,
                        placeholder: (context, url) =>
                            placeHolders[placeholder],
                        width: MediaQuery.of(context).size.width * 0.215,
                        height: MediaQuery.of(context).size.width * 0.250,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.215,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Text(
                        shopTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
