import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helpontheway/models/user.dart';
import 'package:helpontheway/screens/authenticate/sign_in.dart';
import 'package:helpontheway/screens/home/home.dart';
import 'package:helpontheway/screens/wrapper.dart';
import 'package:helpontheway/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:helpontheway/services/auth.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
        initialData: TheUser(uid: "" ),
        value: AuthService().user , 
        
        child: MaterialApp(home: Wrapper() ));
  }
}