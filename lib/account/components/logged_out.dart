import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiggy_app/account/components/mobile_screen.dart';
import 'package:swiggy_app/services/get_mobile_number.dart';

class LoggedOut extends StatefulWidget {
  @override
  _LoggedOutState createState() => _LoggedOutState();
}

class _LoggedOutState extends State<LoggedOut> {
  List<String> mobileNumbers = [];
  GetNumber getNumber = GetNumber();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "assets/images/sign_out.jpg",
            height: size.height * 0.58,
            width: size.width,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "ACCOUNT",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 17),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
            child: Text(
              "Login/Create Account quickly to manage orders",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              width: size.width,
              height: size.height * 0.065,
              child: RaisedButton(
                color: Colors.orange,
                onPressed: () async {
                  mobileNumbers = await getNumber.checkPermission();
                  showNumberDialog();
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: Divider(
              thickness: 1.5,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Container(
              height: size.height * 0.078,
              width: size.width,
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/discount.svg",
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Offers",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              thickness: 1.5,
              color: Colors.grey[300],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Container(
              height: size.height * 0.078,
              width: size.width,
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Icon(Icons.mail_outline, color: Colors.grey),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Send Feedback",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "App version 1.0.1",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  showNumberDialog() {
    Dialog mobileDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                color: Colors.orange,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.centerLeft,
                child: Text(
                  "  Continue With....",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            FlatButton(
              height: MediaQuery.of(context).size.height * 0.1,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MobileScreen(
                      mobileNumber: mobileNumbers[0],
                    ),
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      mobileNumbers[0],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              height: MediaQuery.of(context).size.height * 0.1,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MobileScreen(
                      mobileNumber: mobileNumbers[1],
                    ),
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      mobileNumbers[1],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MobileScreen(
                      mobileNumber: "",
                    ),
                  ),
                );
              },
              child: Text(
                "None of Above",
                style: TextStyle(
                    color: Colors.blue[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => mobileDialog);
  }
}
