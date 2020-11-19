import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:swiggy_app/account/components/logged_in.dart';
import 'package:swiggy_app/account/components/logged_out.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget page;
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    page = LoggedOut();
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
    );
  }

  checkLogin() async {
    String token = await storage.read(key: "token");
    if (token != null) {
      setState(() {
        page = LoggedIn();
      });
    } else {
      page = LoggedOut();
    }
  }
}
