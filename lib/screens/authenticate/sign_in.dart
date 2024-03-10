import 'package:flutter/material.dart';
import 'package:helpontheway/services/auth.dart';



class SignIn extends StatefulWidget {
  final Function toggleView ; 
  SignIn({required this.toggleView}) ; 
  

  @override
  State<SignIn> createState() => _SignInState();
  
  
  
  
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field states
  String email = '';
  String password = '';
  String error = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(height: 40),
              Text(
                "User Sign In \n",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.grey[300],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple[900]??Colors.purple))),
                validator: (value) => value!.contains('@') && value.contains('.')
                    ? null
                    : 'Enter a valid email',
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.grey[300],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple[900]??Colors.purple))),
                validator: (val) =>
                    val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     side: BorderSide(color: Colors.purple[100]??Colors.purple) ,

                    ) , 
                    backgroundColor: Colors.purple  , 

                  ),
                  child: Text('Sign in', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        dynamic result = await _auth.signInWithEmailPassword(
                            email, password);
                      } catch (e) {
                        error = 'Could not sign in with those credentials';
                        print(error);
                      }
                    }
                  }),
              SizedBox(height: 20),

              ElevatedButton(style : ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                         side: BorderSide(color: Colors.purple[100]??Colors.purple) ,
                      ),
                        backgroundColor: Colors.purple , 
                      ),
                  
                  child: Text('Create a new account',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    widget.toggleView();
                    }
                    ),
                    Text(error) ])) ,
                  
      ), ) ; 
  } }
            

    





      