import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hublyn/screens/login_screen.dart';
import 'dashboard_screen.dart';

class LoadingScreen extends StatefulWidget {
  static final String id = 'loading_scrren';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  final _auth = FirebaseAuth.instance;

  void checkIfUserIsLoggedIn()async{

    try{
      final currentUser = await _auth.currentUser();
      if(currentUser!=null){
//    User is Logged in

        Navigator.pushNamed(context, DashboardScreen.id);
      }else{
//    User is logged out
        Navigator.pushNamed(context, LoginScreen.id);
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfUserIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitRotatingCircle(
            color: Colors.greenAccent,
            size: 100.0,
          ),
          SizedBox(height: 30.0,),
          Text('Hublyn.com',
          style: TextStyle(fontSize: 40.0,fontFamily: 'pacifico',color: Colors.greenAccent),
          )
        ],
      ),
    );
  }
}

