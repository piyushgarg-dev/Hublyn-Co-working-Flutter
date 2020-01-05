import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hublyn/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final _user = await _auth.signInWithCredential(credential);
      if (_user != null) {
        Navigator.pushNamed(context, DashboardScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    signIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        size: 30.0,
        color: Colors.blue,
      ),
    );
  }
}
