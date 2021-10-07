import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:specialite/localization/lang_constants.dart';
import 'package:specialite/models/user_location.dart';
import 'package:specialite/widgets/home_cats.dart';
import 'package:specialite/widgets/home_specials.dart';
import 'package:specialite/widgets/l_builder.dart';
import 'package:specialite/widgets/home_rest.dart';
import 'package:specialite/widgets/home_rest_banners.dart';
import 'package:specialite/widgets/s_builder.dart';
import 'package:specialite/widgets/xl_builder.dart';
import '../constants.dart' as constants;
import '../data.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    //print("home: " + data.categories.elementAt(0).titleEn.toString());

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          shadowColor: Colors.white.withOpacity(0.9),
          expandedHeight: 80,
          floating: true,
          pinned: true,
          elevation: 2,
          flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              title: FutureBuilder(
                future: constants.userLocation,
                builder: (BuildContext context,
                    AsyncSnapshot<UserLocation> snapshot) {
                  if (snapshot.hasData) {
                    return Row(children: [
                      Text(getTranslated(context,"h_discover").toString()+' ',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold))),
                      Text(
                        snapshot.data.city,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 224, 177, 65),
                                fontSize: 1,
                                fontWeight: FontWeight.bold)),
                      ),
                    ]);
                  } else {
                    return Text(getTranslated(context,"h_discover").toString()+" "+getTranslated(context,"h_hiroshima").toString(),
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold)));
                  }
                },
              )),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    RestBanner(),
                    Padding(
                      padding: constants.PADDING_LTRB,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            getTranslated(context,"h_only_on").toString()+ 'Specialite!',
                            style: GoogleFonts.poppins(
                                textStyle: constants.TITLE_STYLE),
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color.fromARGB(255, 239, 67, 37),
                            textColor: Colors.white,
                            onPressed: () => {},
                            child: Text(
                              getTranslated(context,"h_see_all"),
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    HomeRest(),
                    Padding(
                      padding: constants.PADDING_LTRB,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            getTranslated(context,"h_cats"),
                            style: GoogleFonts.poppins(
                                textStyle: constants.TITLE_STYLE),
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color.fromARGB(255, 239, 67, 37),
                            textColor: Colors.white,
                            onPressed: () => {},
                            child: Text(
                              getTranslated(context,"h_see_all"),
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SBuilder(),
                    HomeCats(),
                    Padding(
                      padding: constants.PADDING_LTRB,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            getTranslated(context,"h_specs"),
                            style: GoogleFonts.poppins(
                                textStyle: constants.TITLE_STYLE),
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color.fromARGB(255, 239, 67, 37),
                            textColor: Colors.white,
                            onPressed: () => {},
                            child: Text(
                              getTranslated(context,"h_see_all"),
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    HomeSpecials(),

                    // Container(
                    //   padding: constants.PADDING_FOR_QUICKLINKS,
                    //   child: Column(
                    //     children: [
                    //       ListTile(
                    //         leading: Text('Quick links',
                    //             style: GoogleFonts.poppins(
                    //               textStyle: constants.TITLE_STYLE,
                    //             )),
                    //       ),
                    //       ListTile(
                    //         leading: Text(
                    //           'Redeem Code',
                    //           style: GoogleFonts.poppins(
                    //               textStyle: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //           )),
                    //         ),
                    //         trailing: Icon(Icons.navigate_next),
                    //         onTap: () => {},
                    //         dense: true,
                    //       ),
                    //       Divider(
                    //         indent: 15,
                    //         height: 1,
                    //         color: Colors.grey[350],
                    //       ),
                    //       ListTile(
                    //         leading: Text(
                    //           'Customer Support',
                    //           style: GoogleFonts.poppins(
                    //               textStyle: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //           )),
                    //         ),
                    //         trailing: Icon(Icons.navigate_next),
                    //         onTap: () => {},
                    //         dense: true,
                    //       ),
                    //       Divider(
                    //         indent: 15,
                    //         height: 1,
                    //         color: Colors.grey[350],
                    //       ),
                    //       ListTile(
                    //         leading: Text(
                    //           'Send a gift',
                    //           style: GoogleFonts.poppins(
                    //               textStyle: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //           )),
                    //         ),
                    //         trailing: Icon(Icons.navigate_next),
                    //         onTap: () => {},
                    //         dense: true,
                    //       ),
                    //       Divider(
                    //         indent: 15,
                    //         height: 1,
                    //         color: Colors.grey[350],
                    //       ),
                    //       SizedBox(
                    //         height: 100,
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
