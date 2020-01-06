import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../login_screen.dart';

class RequirementScreen extends StatefulWidget {
  @override
  _RequirementScreenState createState() => _RequirementScreenState();
}

class _RequirementScreenState extends State<RequirementScreen> {

  String userRequirement;
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser _user;

  List<String> month = [
    'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'
  ];



  String _email = '';
  String _displayName = '';
  String _photoUrl = '';
  String _uid = '';


  void getCurrentuser()async{

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
    getCurrentuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post A Requirement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children: <Widget>[
              SizedBox(height: 10.0,),

              TextField(
                onChanged: (value){
                   userRequirement = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Requirements',
                ),
              ),
              RaisedButton(
                onPressed: ()async{
                  final zone = DateTime.now().hour.toInt() < 12 ? 'AM':'PM';
                 final res = await _firestore.collection('posts').add({
                    'email':_email,
                    'text':userRequirement,
                    'name':_displayName,
                    'pic':_photoUrl,
                   'timestamp':DateTime.now(),
                   'time':DateTime.now().hour.toString() + ':' + DateTime.now().minute.toString() + ' ' + zone +' - ' + DateTime.now().day.toString()+' '+ month[ DateTime.now().month] + ' '+DateTime.now().year.toString()
                  });
                 await Navigator.pop(context);
                },
                child: Text('POST'),
              ),
            ],
        ),
      ),
    );
  }
}
