import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:hublyn/screens/dashboard_screen.dart';
import 'package:hublyn/screens/loading_screen.dart';
import 'package:hublyn/screens/login_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  FirebaseAnalytics analytics = FirebaseAnalytics();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hublyn',
      initialRoute: LoadingScreen.id,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
        LoginScreen.id: (context) => LoginScreen()
      },
    );
  }
}
