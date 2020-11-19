import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:swiggy_app/pages/profile_page.dart';
import 'package:swiggy_app/services/network_handler.dart';

class LoggedIn extends StatefulWidget {
  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  bool getData = false;
  NetworkHandler networkHandler = NetworkHandler();
  final storage = FlutterSecureStorage();
  String mobileNumber, token, email, name;
  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: getData
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        mobileNumber,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          email,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              )
            : CircularProgressIndicator(),
        actions: <Widget>[
          FlatButton(
            height: 20,
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.orange, fontSize: 15),
            ),
          )
        ],
      ),
      body: Center(
        child: getData
            ? Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Token: $token",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.065,
                        child: RaisedButton(
                          color: Colors.orange,
                          onPressed: () async {
                            await storage.deleteAll();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                                (route) => false);
                          },
                          child: Text(
                            "LOG OUT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  getToken() async {
    token = await storage.read(key: "token");
    mobileNumber = await storage.read(key: "mobile");
    print(mobileNumber);
    var response = await networkHandler.get("/account/$mobileNumber");
    Map<String, dynamic> data = response["data"];
    name = data["name"];
    email = data["email"];
    if (name != null) {
      print([name, email]);
      setState(() {
        getData = true;
      });
    } else {
      print("Data Not Found");
    }
  }
}
