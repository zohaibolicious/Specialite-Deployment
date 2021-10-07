import 'package:flutter/material.dart';
import 'package:specialite/models/user.dart';
import 'package:specialite/screens/tabs_screen.dart';
import 'package:specialite/services/auth.dart';
import 'package:specialite/widgets/my_back_button.dart';
import 'package:specialite/widgets/pill_button.dart';
import '../constants.dart';
import '../loading.dart';
import 'email_signin_screen.dart';

class EmailSignUpScreen extends StatefulWidget {
  static String routeName = "/email_sign_up";
  @override
  _EmailSignUpScreenState createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends State<EmailSignUpScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field states
  String name = "";
  String email = "";
  String password = "";
  String cpassword = "";
  String error = '';

  void signUp() async {
    setState(() {
      loading = true;
    });
    dynamic result = await _auth.signUpEmail(email, password, name);
    setState(() {
      loading = false;
    });
    if (result is User) {
      setState(() {
        error = "Registered Successfully".toLowerCase();
      });
      await Future.delayed(Duration(seconds: 3));
      Navigator.of(context).pushNamed(TabsScreen.routeName);
    } else {
      setState(() {
        error = result.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var statusHeight = MediaQuery.of(context).padding.top;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return loading
        ? Loading()
        : Container(
            child: SafeArea(
              bottom: false,
              child: Scaffold(
                body: Container(
                  // alignment: Alignment.center,
                  height: screenHeight - statusHeight,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: myBackButton(),
                              ),
                              SizedBox(height: 25),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 30),
                                child: Text(
                                  " Register with your Email",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      validator: (val) => val.isEmpty
                                          ? 'Please Enter Name'
                                          : null,
                                      onChanged: (value) {
                                        setState(() {
                                          name = value;
                                        });
                                      },
                                      decoration: inputDecor.copyWith(
                                          labelText: 'Full Name'),
                                    ),
                                    SizedBox(height: 20.0),
                                    TextFormField(
                                      validator: (val) => val.isEmpty
                                          ? 'Please Enter Email'
                                          : null,
                                      onChanged: (value) {
                                        setState(() {
                                          email = value;
                                        });
                                      },
                                      decoration: inputDecor.copyWith(
                                          labelText: 'Email Address'),
                                    ),
                                    SizedBox(height: 20.0),
                                    TextFormField(
                                      validator: (val) => val.length < 6
                                          ? 'Password must be atleast 6 characters'
                                          : null,
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                      obscureText: true,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: inputDecor.copyWith(
                                          labelText: 'Password'),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      validator: (value) {
                                        if (value.length < 6)
                                          return 'Password must be atleast 6 characters';
                                        else if (password != cpassword)
                                          return 'Passwords must match';
                                        else
                                          return null;
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          cpassword = value;
                                        });
                                      },
                                      obscureText: true,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: inputDecor.copyWith(
                                          labelText: 'Confirm Password'),
                                    ),
                                    SizedBox(height: 20),
                                    PillButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          signUp();
                                        }
                                      },
                                      //Navigator.of(context).pushNamed(PhoneScreen.routeName),
                                      buttonText: "Register",
                                      width: double.infinity,
                                      color: Colors.amber,
                                      textColor: Colors.white,
                                    ),
                                    SizedBox(height: 10),
                                    InkWell(
                                      onTap: () => Navigator.of(context)
                                          .pushReplacementNamed(
                                              EmailSignInScreen.routeName),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "  ALREADY HAVE AN ACCOUNT ?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.amber[800]),
                                        ),
                                      )),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      error,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
