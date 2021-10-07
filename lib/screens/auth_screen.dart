import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:specialite/data.dart';
import 'package:specialite/localization/lang_constants.dart';
import 'package:specialite/screens/tabs_screen.dart';
import 'phone_screen.dart';
import 'email_signin_screen.dart';
import 'email_signup_screen.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailSignin = TextEditingController();
  TextEditingController pwdSignin = TextEditingController();
  TextEditingController emailSignup = TextEditingController();
  TextEditingController pwdSignup = TextEditingController();
  TextEditingController pwd2Signup = TextEditingController();

  //User user;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   initializeFirebase();
  // }

  void btnSigninPressed() async {
    // String email = emailSignin.text;
    // String password = pwdSignin.text;
    // UserCredential userCredential =
    //     await signInWithEmail(email, password, context);
    // if (userCredential != null) {
    //   user = userCredential.user;
    // }
  }

  void btnSignupPressed() async {
    // String email = emailSignup.text;
    // String password = pwdSignup.text;
    // UserCredential userCredential = await signUpWithEmail(email, password, context);
    // if (userCredential != null) {
    //   user = userCredential.user;

    //   Navigator.of(context).pushNamed(PhoneScreen.routeName);
    // }
    Navigator.of(context).pushNamed(PhoneScreen.routeName);
  }

  void btnApplePressed() async {
    // UserCredential userCredential = await signInWithGoogle();
    // if (userCredential != null) {
    //   user = userCredential.user;
    // }
  }
  Future<bool> btnGooglePressed() async {
    UserCredential userCredential = await signInWithGoogle();
    if (userCredential != null) {
      data.user = userCredential.user;
      return true;
    }
    return false;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, children: <
              Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/spec_icon.png',
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: Text(
                        getTranslated(context,"a_sign_up"),
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                      child: Text(
                          '\n'+getTranslated(context,"a_choose"),
                          style: TextStyle(fontSize: 18.0),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 0, left: 30.0, right: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Color(0xff93b3d6),
                      ),
                    ),
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          shadowColor: Color(0xff93b3d6),
                          color: Color(0xff1877f2),
                          elevation: 4.0,
                          child: InkWell(
                            onTap: () {
                              //Navigator.pushNamed(context, '/sign-up');
                            },
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image:
                                      AssetImage('assets/Icons/facebook.png'),
                                  height: 30.0,
                                ),
                                Text(
                                  '      '+getTranslated(context,"a_fb"),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      color: Colors.white),
                                )
                              ],
                            )),
                          ),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          shadowColor: Color(0xffefefef),
                          color: Colors.red[10],
                          elevation: 4.0,
                          child: InkWell(
                            onTap: () async{
                              if (await btnGooglePressed()){
                                Navigator.pushNamed(context, '/home');
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Google SignIn Unsuccessful")
                                  )
                                );
                              }
                            },
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image:
                                      AssetImage('assets/Icons/googleicon.png'),
                                  height: 25.0,
                                ),
                                Text(
                                  '       '+getTranslated(context,"a_google"),
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                  ),
                                )
                              ],
                            )),
                          ),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green[200],
                          elevation: 3.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(EmailSignUpScreen.routeName);
                            },
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                Text(
                                  '       '+getTranslated(context,"a_email"),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      color: Colors.white),
                                )
                              ],
                            )),
                          ),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          shadowColor: Color(0xfffffaf0),
                          color: Colors.amber[300],
                          elevation: 4.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(TabsScreen.routeName);
                            },
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                Text('        '+getTranslated(context,"a_guest"),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ))
                              ],
                            )),
                          ),
                        )),
                  ],
                )),
          ])),
    );
  }
}
