import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swiggy_app/components/home_datalist.dart';
import 'package:swiggy_app/helpers/home_shimmerlist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;
  NetworkImage festofferImage;
  @override
  void initState() {
    festofferImage = NetworkImage(
        "https://evening-reef-45102.herokuapp.com/uploads/fest_offer/fest_offer.jpg");
    festofferImage.resolve(ImageConfiguration()).addListener(
      ImageStreamListener((info, call) {
        if (mounted) {
          setState(() {
            isLoaded = true;
          });
        }
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Material(
          type: MaterialType.transparency,
          child: InkResponse(
            radius: size.width * 0.35,
            onTap: () {},
            splashColor: Colors.grey[75],
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SvgPicture.asset("assets/icons/location.svg"),
                    Text(
                      "Juhu",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Juhu Rd,Airport Area,Juhu,Mumbai..",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        bottomOpacity: 0.0,
        actions: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: InkResponse(
              radius: size.width * 0.2,
              onTap: () {},
              splashColor: Colors.grey[75],
              child: Row(
                children: <Widget>[
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.01),
                      child: SvgPicture.asset("assets/icons/discount.svg")),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.005, 0, size.width * 0.015, 0),
                    child: Text(
                      "Offers",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueGrey),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: isLoaded
          ? HomeDataList(
              festofferImage: festofferImage,
            )
          : HomeShimmerList(),
    );
  }
}
