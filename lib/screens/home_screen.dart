import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_app/Models/bottom_navmodel.dart';
import 'package:swiggy_app/pages/cart_page.dart';
import 'package:swiggy_app/pages/home_page.dart';
import 'package:swiggy_app/pages/profile_page.dart';
import 'package:swiggy_app/pages/search_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavModel>(
      create: (context) => BottomNavModel(),
      child: Consumer<BottomNavModel>(
        builder: (context, model, child) => Scaffold(
          bottomNavigationBar: Row(
            children: <Widget>[
              buildNavBarItem(
                  Icons.home, Icons.home_outlined, 0, "SWIGGY", model),
              buildNavBarItem(
                  Icons.search, Icons.search_outlined, 1, "SEARCH", model),
              buildNavBarItem(Icons.shopping_cart, Icons.shopping_cart_outlined,
                  2, "CART", model),
              buildNavBarItem(
                  Icons.person, Icons.person_outlined, 3, "ACCOUNT", model),
            ],
          ),
          body: model.currentPage,
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData solidIcon, IconData outlineIcon, int index,
      String title, BottomNavModel model) {
    return InkResponse(
      radius: MediaQuery.of(context).size.width * 0.15,
      splashColor: Colors.grey[75],
      onTap: () {
        model.currentTab = index;
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              index == model.currentTab ? solidIcon : outlineIcon,
              color: index == model.currentTab ? Colors.orange : Colors.grey,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: index == model.currentTab ? Colors.orange : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
