import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FoodType extends StatefulWidget {
  @override
  _FoodTypeState createState() => _FoodTypeState();
}

class _FoodTypeState extends State<FoodType> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: CachedNetworkImageProvider(
                  "https://evening-reef-45102.herokuapp.com/uploads/food_type/food_type1.jpg"),
              width: size.width * 0.46,
              height: size.height * 0.18,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {},
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: CachedNetworkImageProvider(
                  "https://evening-reef-45102.herokuapp.com/uploads/food_type/food_type2.jpg"),
              width: size.width * 0.46,
              height: size.height * 0.18,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
