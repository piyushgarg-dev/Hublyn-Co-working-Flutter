import 'package:flutter/material.dart';
import 'package:hublyn/screens/dashboard_screen.dart';
import 'package:hublyn/screens/loading_screen.dart';
import 'package:hublyn/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hublyn',
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        DashboardScreen.id:(context) => DashboardScreen(),
        LoginScreen.id: (context) => LoginScreen()
      },
    );
  }
}
