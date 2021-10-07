import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:specialite/data.dart';
import 'package:specialite/models/user.dart';
import 'package:specialite/screens/ProfilePage.dart';
import 'package:specialite/screens/checkout.dart';
import 'package:specialite/screens/my_reservations.dart';
import 'package:specialite/screens/wrapper.dart';
import 'package:specialite/services/auth.dart';
import 'package:specialite/payment/screens/phome.dart';
import 'package:specialite/payment/screens/existing-cards.dart';

import 'localization/localization.dart';
import 'screens/auth_screen.dart';
import 'screens/phone_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/home_screen.dart';
import 'screens/email_signin_screen.dart';
import 'screens/email_signup_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/restaurant_screen.dart';
import 'data.dart';
import 'localization/lang_constants.dart';

//var users = <String>[];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await data.getData();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale=Locale("en", "US");
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      initialData: null,
      value: null,
      child: MaterialApp(
        title: 'Specialite',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        locale: _locale,
        supportedLocales: [
          Locale("en", "US"),
          Locale("ja", "JA"),
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        home: Wrapper(),
        routes: {
          ProfilePage.routeName: (ctx) => ProfilePage(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
          PhoneScreen.routeName: (ctx) => PhoneScreen(),
          VerificationScreen.routeName: (ctx) => VerificationScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          EmailSignInScreen.routeName: (ctx) => EmailSignInScreen(),
          EmailSignUpScreen.routeName: (ctx) => EmailSignUpScreen(),
          TabsScreen.routeName: (ctx) => TabsScreen(),
          RestaurantScreen.routeName: (ctx) => RestaurantScreen(),
          PaymentPage.routeName: (context) => PaymentPage(),
          ExistingCardsPage.routeName: (context) => ExistingCardsPage(),
          MyReservations.routeName: (context) => MyReservations(),
          Checkout.routeName: (context) => Checkout(),
        },
      ),
    );
  }
}
