import 'package:flutter/material.dart';

import 'verification_screen.dart';
import '../widgets/pill_button.dart';
import '../widgets/my_back_button.dart';
import '../data.dart';

class PhoneScreen extends StatelessWidget {
  static String routeName = '/phone';

  TextEditingController phoneNumber = TextEditingController();

  void btnNextPressed(BuildContext context) {
    Navigator.of(context).pushNamed(VerificationScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var statusHeight = MediaQuery.of(context).padding.top;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return Container(
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Container(
            height: screenHeight - statusHeight,
            padding: EdgeInsets.all(20.0),
            child: Column(children: [
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
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter your phone number below",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 50),
                    Form(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.red[400],
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              Center(
                child: PillButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(VerificationScreen.routeName),
                  buttonText: "Next",
                  width: double.infinity,
                  color: Colors.red[400],
                  textColor: Colors.white,
                ),
              ),
              // Container(
              //   padding: EdgeInsets.fromLTRB(25, 60, 0, 0),
              //   alignment: Alignment.centerLeft,
              //   child: myBackButton(),
              // ),
              // Container(
              //   // padding: EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
              //   child: Text(
              //     'Phone',
              //     style: TextStyle(
              //       fontFamily: 'Montserrat',
              //       fontSize: 30.0,
              //       fontWeight: FontWeight.bold,
              //       color: amberColor,
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 50,
              // ),
              // Container(
              //   child: Text(
              //     'Enter your phone number below',
              //     style: TextStyle(
              //       fontSize: 20.0,
              //       fontFamily: 'Montserrat',
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // Container(
              //   height: 50,
              // ),
              // Container(
              //   padding: EdgeInsets.all(25.0),
              //   child: Form(
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: TextFormField(
              //             keyboardType: TextInputType.phone,
              //             controller: phoneNumber,
              //             decoration: const InputDecoration(
              //                 hintText: "Phone Number"),
              //           ),
              //         ),
              //         Container(
              //           height: 50,
              //         ),
              //         Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: PillButton(
              //             onPressed: () => btnNextPressed(context),
              //             buttonText: "Next",
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ]),
          ),
        ),
      ),
    );
  }
}
