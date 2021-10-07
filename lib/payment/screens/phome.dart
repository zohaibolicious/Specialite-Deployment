import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:specialite/localization/lang_constants.dart';
import 'package:specialite/payment/screens/existing-cards.dart';
import 'package:specialite/payment/services/payment-service.dart';

class PaymentPage extends StatefulWidget {
  static String routeName = "/paymentViaNewCard";

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please Wait...');
    await dialog.show();
    StripeTransactionResponse response =
        await StripeService.payViaNewCard(amount: '150', currency: 'USD');
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration: new Duration(milliseconds: response.success ? 2000 : 3000),
    ));
    await dialog.hide();
  }

  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.pushNamed(context, ExistingCardsPage.routeName);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text(getTranslated(context, "c_payment")),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch (index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: theme.primaryColor);
                  text = Text(getTranslated(context, "p_new_card"));
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: theme.primaryColor);
                  text = Text(getTranslated(context, "p_existing_card"));
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: theme.primaryColor,
                ),
            itemCount: 2),
      ),
    );
  }
}
