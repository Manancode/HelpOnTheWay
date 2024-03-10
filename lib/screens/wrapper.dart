import 'package:flutter/material.dart';
import 'package:helpontheway/models/user.dart';
import 'package:helpontheway/screens/authenticate/authenticate.dart';
import 'package:helpontheway/screens/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    print("User = " + user.toString());
    // return either Home or Authenticate
    if (user != null) {
      return Home();
    } else {
      return Authenticate();
    }
  }
}
