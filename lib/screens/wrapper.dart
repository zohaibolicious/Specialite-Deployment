import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:specialite/models/user.dart';
import 'package:specialite/screens/auth_screen.dart';
import 'package:specialite/screens/tabs_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      print("User Null");
      return AuthScreen();
    } else {
      print("User Authed");
      return TabsScreen();
    }
  }
}
