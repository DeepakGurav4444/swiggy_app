import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_app/components/shop_categories.dart';

import 'food_type.dart';

class HomeDataList extends StatefulWidget {
  final NetworkImage festofferImage;

  const HomeDataList({Key key, @required this.festofferImage})
      : super(key: key);
  @override
  _HomeDataListState createState() => _HomeDataListState();
}

class _HomeDataListState extends State<HomeDataList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Ink.image(
            image: widget.festofferImage,
            width: size.width,
            height: size.height * 0.30,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {},
            ),
          ),
          FoodType(),
          ShopCategories(),
        ],
      ),
    );
  }
}
