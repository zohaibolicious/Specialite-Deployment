import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../data.dart';
import '../screens/tabs_screen.dart';
import '../widgets/my_back_button.dart';
import '../widgets/pill_button.dart';

class VerificationScreen extends StatefulWidget {
  static String routeName = '/verification';

  VerificationScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var statusHeight = MediaQuery.of(context).padding.top;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    return Container(
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.white,
          //   // leading: Icon(Icons.arrow_back_ios),
          // ),
          // resizeToAvoidBottomPadding: false,
          body: Container(
            height: screenHeight - statusHeight,
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: myBackButton(),
                        ),
                        SizedBox(height: 15),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Verification',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'We sent you a code to verify your phone number',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Enter your code here',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 40),
                        PinCodeTextField(
                          appContext: context,
                          keyboardType: TextInputType.number,
                          length: 6,
                          pastedTextStyle: TextStyle(
                            color: Colors.black,
                          ),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            inactiveColor: Colors.grey[400],
                            activeColor: Colors.grey[400],
                            activeFillColor: Colors.grey[400],
                            inactiveFillColor: Colors.grey[400],
                            selectedColor: Colors.grey[400],
                            selectedFillColor: Colors.grey[400],
                            fieldWidth: (screenWidth - 40) / 8,
                            borderWidth: 1,
                          ),
                          onChanged: (value) => print("Changed: " + value),
                        ),
                        SizedBox(height: 40),
                        Container(
                          child: Text(
                            "Didn't receive code?",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Resend Code',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ),
                PillButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(TabsScreen.routeName),
                  width: double.infinity,
                  textColor: Colors.white,
                  color: Colors.red[400],
                  buttonText: 'Next',
                ),
              ],
            ),
          ),
          // SizedBox(height: 15.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       'New to Spotify?',
          //       style: TextStyle(
          //         fontFamily: 'Montserrat',
          //       ),
          //     ),
          //     SizedBox(width: 5.0),
          //     InkWell(
          //       child: Text('Register',
          //           style: TextStyle(
          //               color: Colors.green,
          //               fontFamily: 'Montserrat',
          //               fontWeight: FontWeight.bold,
          //               decoration: TextDecoration.Outline)),
          //     )
          //   ],
          // )
        ),
      ),
    );
  }
}
