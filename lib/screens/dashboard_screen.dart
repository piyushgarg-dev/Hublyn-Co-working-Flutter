import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:hublyn/screens/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  static final String id = 'dashboard_screen';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final _auth = FirebaseAuth.instance;
  FirebaseUser _user;

  String _email = '';
  String _displayName = '';
  String _photoUrl = '';
  String _uid = '';

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }


  void getCurrentUser()async{

    try {
      final FirebaseUser currentUser = await _auth.currentUser();
      if (currentUser != null) {
        setState(() {
          _user = currentUser;
          _email = _user.email;
          _displayName = _user.displayName;
          _photoUrl = _user.photoUrl;
          _uid = _user.uid;

        });
      } else {
        Navigator.pushNamed(context, LoginScreen.id);
      }
    }catch(e){
      print(e);
    }

  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){},
      child: Scaffold(
//      TODO: Build Dashboard
      body: Center(
        child: Text('Hello $_displayName'),
      ),
      ),
    );
  }
}
