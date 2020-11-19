import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerList extends StatefulWidget {
  @override
  _HomeShimmerListState createState() => _HomeShimmerListState();
}

class _HomeShimmerListState extends State<HomeShimmerList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
          child: Shimmer.fromColors(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Container(
                width: size.width,
                height: size.height * 0.15,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Container(
                width: size.width,
                height: size.height * 0.15,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Container(
                width: size.width,
                height: size.height * 0.10,
                color: Colors.grey,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: size.width * 0.5,
                  height: size.height * 0.02,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 2.5, 0),
                      child: Container(
                        width: size.width * 0.20,
                        height: size.height * 0.10,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 2.5, 0),
                      child: Container(
                        width: size.width * 0.20,
                        height: size.height * 0.01,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 2.5, 0),
                      child: Container(
                        width: size.width * 0.20,
                        height: size.height * 0.10,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 2.5, 0),
                      child: Container(
                        width: size.width * 0.20,
                        height: size.height * 0.01,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 2.5, 0),
                      child: Container(
                        width: size.width * 0.20,
                        height: size.height * 0.10,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 2.5, 0),
                      child: Container(
                        width: size.width * 0.20,
                        height: size.height * 0.01,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 2.5, 0),
                      child: Container(
                        width: size.width * 0.20,
                        height: size.height * 0.10,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 2.5, 0),
                      child: Container(
                        width: size.width * 0.20,
                        height: size.height * 0.01,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Container(
                        width: size.width * 0.04,
                        height: size.height * 0.10,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Container(
                        width: size.width * 0.04,
                        height: size.height * 0.01,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 2.5, 0),
                  child: Container(
                    width: size.width * 0.80,
                    height: size.height * 0.25,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Container(
                    width: size.width * 0.14,
                    height: size.height * 0.25,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
        baseColor: Colors.grey[100],
        highlightColor: Color(0xd4ebf2),
      )),
    );
  }
}
