import './pages/home.dart';
import 'package:flutter/material.dart';
import './pages/login.dart';
import 'package:provider/provider.dart';
import './provider/user_provider.dart';
import './pages/splash.dart';
import './select.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (_) => UserProvider.initialize(),
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.deepOrange
    ),
    home: ScreensController(),
  )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return Select();
      default: return Login();
    }
  }
}



