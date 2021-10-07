import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:specialite/language.dart';
import 'package:specialite/models/user.dart';
import 'package:specialite/screens/ProfilePage.dart';
import 'package:specialite/screens/my_reservations.dart';
import 'package:specialite/services/auth.dart';
import '../constants.dart' as constants;
import '../main.dart';
import '../userdata.dart' as userdata;
import 'package:specialite/payment/screens/phome.dart';
import 'package:specialite/localization/lang_constants.dart';

import 'auth_screen.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
String language = "English";
bool isSwitched = false;
class _ProfileScreenState extends State<ProfileScreen> {

  final AuthService _auth = AuthService();

  String sign_text;

  Future signOut() async {
    await _auth.signOut();
  }

  Future<void> toggleSwitch(bool value) async {
    if (!isSwitched) {
      setState(() {
        isSwitched = true;
        language = "Japanese";
      });
      Locale _locale = Locale("ja", "JA");
      MyApp.setLocale(context, _locale);
    } else {
      setState(() {
        isSwitched = false;
        language = "English";
      });
      Locale _locale = Locale("en", "US");
      MyApp.setLocale(context, _locale);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      setState(() {
        sign_text = 'Sign In';
      });
    } else {
      setState(() {
        sign_text = 'Sign Out';
      });
    }
    return SafeArea(
        child: CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildListDelegate(
        [
          Container(
              color: Colors.white,
              child: Column(children: [
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      getTranslated(context, "p_howdy_left"),
                      // +
                      // " " +
                      // getTranslated(context,"p_shahrukh") +
                      // " " +
                      // getTranslated(context,"p_howdy_right"),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Container(
                          height: 75,
                          width: 75,
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://filmfare.wwmindia.com/content/2020/jul/shahrukhkhan41596116759.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated(context, "p_shahrukh"),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("5 " + getTranslated(context, "p_orders")),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(
                          getTranslated(context, "h_quick"),
                          style: constants.TITLE_STYLE,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(11.0, 0, 0, 0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          // onTap: () {},
                          child: Container(
                            height: 50,
                            child: Row(
                              children: [
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    language,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched,
                                  activeColor: Colors.white,
                                  activeTrackColor: Colors.red[400],
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.red[400],
                                  // inactiveTrackColor: Colors.white10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        indent: 15,
                        height: 1,
                        color: Colors.grey[350],
                      ),
                      ListTile(
                        leading: Text(
                          getTranslated(context, "p_pay"),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.navigate_next),
                        onTap: () => {},
                        dense: true,
                      ),
                      Divider(
                        indent: 15,
                        height: 1,
                        color: Colors.grey[350],
                      ),
                      /*ListTile(
                        leading: Text(
                          'English',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.compare_arrows),
                        onTap: () => {},
                        dense: true,
                      ),
                      Divider(
                        indent: 15,
                        height: 1,
                        color: Colors.grey[350],
                      ),*/
                      ListTile(
                        leading: Text(
                          getTranslated(context, "p_orders"),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.navigate_next),
                        onTap: () => Navigator.pushNamed(context, MyReservations.routeName),
                        dense: true,
                      ),
                      Divider(
                        indent: 15,
                        height: 1,
                        color: Colors.grey[350],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: constants.PADDING_FOR_QUICKLINKS,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(
                          getTranslated(context, "p_settings"),
                          style: constants.TITLE_STYLE,
                        ),
                      ),
                      /* ListTile(
                        leading: Text(
                          'Credits and Tokens',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.navigate_next),
                        onTap: () => {},
                        dense: true,
                      ),
                      Divider(
                        indent: 15,
                        height: 1,
                        color: Colors.grey[350],
                      ),*/
                      ListTile(
                        leading: Text(
                          getTranslated(context, "p_pay_meths"),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.navigate_next),
                        onTap: () => {
                          Navigator.of(context).pushNamed(PaymentPage.routeName)
                        },
                        dense: true,
                      ),
                      Divider(
                        indent: 15,
                        height: 1,
                        color: Colors.grey[350],
                      ),
                      Divider(
                        indent: 15,
                        height: 1,
                        color: Colors.grey[350],
                      ),
                      ListTile(
                        leading: Text(
                          getTranslated(context, "p_settings"),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.navigate_next),
                        onTap: () => {
                          Navigator.pushNamed(context, ProfilePage.routeName)
                        },
                        dense: true,
                      ),
                      Divider(
                        indent: 15,
                        height: 1,
                        color: Colors.grey[350],
                      ),
                      ListTile(
                        leading: Text(
                          sign_text,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.navigate_next),
                        onTap: () {
                          if (sign_text == 'Sign In') {
                            Navigator.pushNamed(context, AuthScreen.routeName);
                          } else
                            signOut();
                        },
                        dense: true,
                      ),
                      Divider(
                        indent: 15,
                        height: 1,
                        color: Colors.grey[350],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ]))
        ],
      ))
    ]));
  }
}
