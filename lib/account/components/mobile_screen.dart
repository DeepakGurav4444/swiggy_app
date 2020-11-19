import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:swiggy_app/account/register_screen.dart';
import 'package:swiggy_app/pages/profile_page.dart';
import 'package:swiggy_app/services/network_handler.dart';

class MobileScreen extends StatefulWidget {
  final String mobileNumber;

  const MobileScreen({Key key, @required this.mobileNumber}) : super(key: key);

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  bool circular = false;
  NetworkHandler networkHandler = NetworkHandler();
  bool userAlereadyExist = false;
  final storage = new FlutterSecureStorage();
  final mobileFormKey = GlobalKey<FormState>();
  TextEditingController _mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _mobileNumberController.text = widget.mobileNumber;
    _mobileNumberController.selection = TextSelection.fromPosition(
        TextPosition(offset: _mobileNumberController.text.length));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: mobileFormKey,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: StickyHeader(
                  header: Container(
                    height: size.height * 0.08,
                    color: Colors.blueGrey[700],
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter Mobile Number',
                      style: const TextStyle(color: Colors.orange),
                    ),
                    width: size.width,
                  ),
                  content: Container(
                    child: Image.asset(
                      "assets/images/sign_out.jpg",
                      height: size.height * 0.58,
                      width: size.width,
                    ),
                  )),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
                    child: Text(
                      "Enter your mobile number to proceed",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _mobileNumberController,
                        validator: (String val) {
                          if (val.isEmpty) {
                            setState(() {
                              circular = false;
                            });
                            return "Please Enter Your Phone Number";
                          } else if (val.length != 10) {
                            setState(() {
                              circular = false;
                            });
                            return "Please Enter Your correct Phone Number";
                          } else if (userAlereadyExist) {
                            setState(() {
                              circular = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "10 digit Mobile Number",
                          prefix: Text(
                            "+91",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.065,
                      child: RaisedButton(
                        color: Colors.orange,
                        onPressed: () async {
                          setState(() {
                            circular = true;
                          });
                          if (mobileFormKey.currentState.validate()) {
                            await checkUser();
                            if (userAlereadyExist) {
                              Map<String, String> data = {
                                "mobile_number": _mobileNumberController.text,
                              };
                              var responseLogin = await networkHandler.post(
                                  "/account/login", data);
                              if (responseLogin.statusCode == 200 ||
                                  responseLogin.statusCode == 201) {
                                Map<String, dynamic> output =
                                    json.decode(responseLogin.body);
                                print(output["token"]);
                                await storage.write(
                                    key: "token", value: output["token"]);
                                await storage.write(
                                    key: "mobile",
                                    value: _mobileNumberController.text);
                                setState(() {
                                  circular = false;
                                });
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()),
                                    (route) => false);
                              }
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RegisterScreen(
                                    mobileNumber: _mobileNumberController.text,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        child: circular
                            ? Container(
                                color: Colors.orange,
                                padding: EdgeInsets.all(10),
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                "CONTINUE",
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
            ),
          ],
        ),
      ),
    );
  }

  checkUser() async {
    var response = await networkHandler
        .get("/account/checkmobile/${_mobileNumberController.text}");
    if (response["Status"]) {
      setState(() {
        print("User Aleredy Exist");
        userAlereadyExist = true;
      });
    } else {
      setState(() {
        print("User Not Exist");
        userAlereadyExist = false;
      });
    }
  }
}
