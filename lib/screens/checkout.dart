

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:specialite/data.dart';
import 'package:specialite/localization/lang_constants.dart';
import 'package:specialite/modelss/Order.dart';
import 'package:specialite/payment/screens/existing-cards.dart';
import 'package:specialite/payment/screens/phome.dart';


class Checkout extends StatefulWidget{
  static String routeName="/checkout";

  @override
  _MyCheckoutState createState() => _MyCheckoutState();
}

class _MyCheckoutState extends State<Checkout> {
  CollectionReference orderCol= FirebaseFirestore.instance.collection('Bookings');

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    double screenHeight = mq.size.height;
    double screenWidth = mq.size.width;
    double headingSize = screenHeight/32;
    double defFontSize = screenHeight/48;
    int total=0;
    for(int index=0;index<data.newOrder.price.length;index++)
      total+=(data.newOrder.price[index]*data.newOrder.quantity[index]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              data.newOrder.restName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:defFontSize,
                  color: Colors.black),
            ),
            centerTitle: true,
            leading: Container(
              child: Material(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Color(0xffdddddd),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_rounded),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              Container(
                child: Material(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Color(0xffdddddd),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.info),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                getTranslated(context, "c_orderItems"),
                                style: TextStyle(
                                    fontSize:headingSize, fontWeight: FontWeight.bold),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                getTranslated(context, "f_change"),
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                              color: Color(0xffe1ad3d),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.all(0),
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.newOrder.name.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: screenWidth/8,
                            child: ListTile(
                              onTap: () {},
                              title: Text(
                                data.newOrder.name[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize:defFontSize),
                              ),
                              leading: Icon(
                                Icons.check_circle,
                                color: Color(0xffdb0035),
                              ),
                              trailing: Text(
                                "¥" + (data.newOrder.price[index]*data.newOrder.quantity[index]).toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize:defFontSize),
                              ),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        onTap: () {},
                        title: Text(
                          getTranslated(context, "c_comment"),
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize:defFontSize),
                        ),
                        subtitle: Text(
                          getTranslated(context, "c_specialReq"),
                          style:
                          TextStyle(fontSize:defFontSize, color: Colors.grey),
                        ),
                        leading: Icon(
                          Icons.message_rounded,
                          color: Color(0xffdb0035),
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      //   child: Text(
                      //     "Recommendations",
                      //     style:
                      //     TextStyle(fontSize:headingSize, fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      // ListView.builder(
                      //   padding: EdgeInsets.all(0),
                      //   physics: ClampingScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemCount: recommendedItems.length,
                      //   itemBuilder: (context, index) {
                      //     return Container(
                      //       height: screenWidth/8,
                      //       child: ListTile(
                      //         onTap: () {},
                      //         title: Text(
                      //           recommendedItems[index].title,
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold, fontSize:defFontSize),
                      //         ),
                      //         leading: Icon(
                      //           Icons.check_circle,
                      //           color: Color(0xffdb0035),
                      //         ),
                      //         trailing: Text(
                      //           "¥" + recommendedItems[index].price.toString(),
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold, fontSize:defFontSize),
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          getTranslated(context, "c_payment"),
                          style:
                          TextStyle(fontSize:headingSize, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: screenWidth/8,
                        child: ListTile(
                          onTap: () {},
                          leading: Text(
                            "S",
                            style: TextStyle(
                                fontSize: screenWidth/10,
                                color: Color(0xffdb0035),
                                fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            getTranslated(context, "c_promo"),
                            style:
                            TextStyle(fontSize:defFontSize, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            getTranslated(context, "c_benefits"),
                            style: TextStyle(
                                fontSize:defFontSize,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        height: screenWidth/8,
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, PaymentPage.routeName);
                          },
                          leading: Icon(
                            Icons.credit_card,
                            color: Color(0xffdb0035),
                          ),
                          title: Text(
                            getTranslated(context, "p_pay_meths"),
                            style:
                            TextStyle(fontSize:defFontSize, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          getTranslated(context, "c_total"),
                          style:
                          TextStyle(fontSize:headingSize, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    getTranslated(context, "c_subTotal"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:defFontSize,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "¥"+total.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:defFontSize,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    getTranslated(context, "c_total"),
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize:defFontSize,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "¥"+total.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize:defFontSize,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          height: screenWidth / 8,
                          child: Material(
                            borderRadius: BorderRadius.circular(5.0),
                            shadowColor: Color(0xffff9eb1),
                            color: Color(0xffdb0035),
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () {
                                orderCol.add({
                                  'restName': data.newOrder.restName,
                                  'itemName': data.newOrder.name,
                                  'itemQuantity': data.newOrder.quantity,
                                  'userid': data.newOrder.userID,
                                  'dateTime': Timestamp.fromDate(data.newOrder.dateTime),
                                  'paid':data.newOrder.paid,
                                });
                                Navigator.of(context).pop();
                              },
                              child: Center(
                                child: Text(
                                  getTranslated(context, "r_submit"),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                )
              ]))
        ],
      ),
    );
  }
}