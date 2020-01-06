import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../login_screen.dart';
import 'components/home_cards.dart';
import 'requirement_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser _user;



  String _email = '';
  String _displayName = '';
  String _photoUrl = '';
  String _uid = '';


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
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: _firestore.collection('posts').orderBy('timestamp',descending: true).snapshots(),
        builder: (context,snapshot){

          if(snapshot.hasData){
            final posts = snapshot.data.documents;
            List<Widget> postlist = [];
               for(var post in posts){
                 final postText = post.data['text'];
                 final postEmail = post.data['email'];
                 final postName = post.data['name'];
                 final pic = post.data['pic'];
                 final time = post.data['time'];

                 postlist.add(
                      HomeCard(
                        caption: postText,
                        userEmail: postEmail,
                        userName: postName,
                        userPic: pic,
                        time:time

                  ),
                 );


               }
               return ListView(
                 children: postlist,
               );
          }
          return Container(
            child: Text('No Posts'),
          );



        }

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RequirementScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


//StreamBuilder(
//stream: _firestore.collection('posts').snapshots(),
//builder: (context,snapshot){
//if(snapshot.hasData){
//final posts = snapshot.data.documents;
//List<Widget> postlist = [];
//
//for(var post in posts){
//final postText = post.data['text'];
//final postEmail = post.data['email'];
//final postName = post.data['name'];
//final pic = post.data['pic'];
//
//postlist.add(
//HomeCard(
//caption: postText,
//userEmail: postEmail,
//userName: postName,
//userPic: pic,
//)
//);
//
//
//}
//
//
//return ListView(
//children: postlist,
//);
//}
//},
//),