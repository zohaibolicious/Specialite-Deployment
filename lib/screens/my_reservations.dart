import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:specialite/localization/lang_constants.dart';
import 'package:specialite/modelss/Order.dart';
import 'package:specialite/data.dart';

class MyReservations extends StatefulWidget {
  static String routeName="/myreservations";
  const MyReservations({Key key}) : super(key: key);

  @override
  _MyReservationsState createState() => _MyReservationsState();
}

class _MyReservationsState extends State<MyReservations> {
  List<Order> orders = data.orders;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: null,
        shadowColor: Colors.white,
        elevation: 0,
        title: Text(getTranslated(context, "r_title"),
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold))),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.red,
                        )
                    ),
                    child: ListTile(
                      title: Text(orders[index].orderID,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)
                          )
                      ),
                      trailing: IconButton(
                        color: Colors.amber[300],
                        icon: Icon(Icons.qr_code_rounded),
                        onPressed: () =>
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              // false = user must tap button, true = tap outside dialog
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: Text(
                                      'QR Code',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold))
                                  ),
                                  content: Container(
                                    padding: EdgeInsets.all(20),
                                    height: 400,
                                    width: 400,
                                    child: QrImage(
                                      data: orders[index].orderID,
                                      version: QrVersions.auto,
                                      size: 320,
                                      gapless: false,
                                    ),
                                  ),
                                );
                              },
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,)
                ],
              );
            }),
      ),
    );
  }
}
