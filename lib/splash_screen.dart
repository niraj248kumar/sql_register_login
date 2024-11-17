import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sing_up_login_sql/singUp/sing_up_page.dart';

import 'DatabaseService.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var dbServes = DatabaseServices();
  List<Map<String, dynamic>> userList =[];
  int? isLogin;

  @override
  void initState() {
    super.initState();
    feachData();
    splace();

  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(title: Center(child: Text('Splash Screen')),),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
  void feachData() async{
    var user =await dbServes.getAuthData();
    setState(() {
      userList = user;
      isLogin = userList[0]['isLogin'];
    });

  }
  void splace(){
    Timer(Duration(seconds: 2),(){
      if(isLogin == 1 && isLogin != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage(),));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SingUpPage(),));
      }
    });
  }
}

