import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_app/Models/circular_model.dart';
import 'package:swiggy_app/account/components/profile_page.dart';
import 'package:swiggy_app/screens/home_screen.dart';
import 'package:swiggy_app/services/network_handler.dart';

class RegisterScreen extends StatefulWidget {
  final String mobileNumber;

  const RegisterScreen({Key key, @required this.mobileNumber})
      : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerFormKey = GlobalKey<FormState>();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  NetworkHandler networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _mobileNumberController.text = widget.mobileNumber;
    return ChangeNotifierProvider<CircularModel>(
      create: (context) => CircularModel(),
      child: Consumer<CircularModel>(
        builder: (context, model, child) => Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: registerFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: TextFormField(
                        enabled: false,
                        keyboardType: TextInputType.number,
                        controller: _mobileNumberController,
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
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "Email can't be Empty";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Email Adderess",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _nameController,
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "Name can't be Empty";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                      ),
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
                              model.circularStatus = true;
                              if (registerFormKey.currentState.validate()) {
                                Map<String, String> data = {
                                  "mobile_number": _mobileNumberController.text,
                                  "name": _nameController.text,
                                  "email": _emailController.text
                                };
                                print(data);
                                var responseRegister = await networkHandler
                                    .post("/account/register", data);
                                print("User Registered");
                                if (responseRegister.statusCode == 200 ||
                                    responseRegister.statusCode == 201) {
                                  Map<String, String> data = {
                                    "mobile_number":
                                        _mobileNumberController.text,
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
                                    model.circularStatus = false;
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                        (route) => false);
                                  } else {
                                    print("Network Error");
                                  }
                                } else {
                                  model.circularStatus = false;
                                }
                              }
                            },
                            child: model.circularStatus
                                ? Container(
                                    color: Colors.orange,
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
