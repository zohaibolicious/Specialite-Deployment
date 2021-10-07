import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:specialite/payment/services/payment-service.dart';
import 'package:stripe_payment/stripe_payment.dart';

class ExistingCardsPage extends StatefulWidget {
  ExistingCardsPage({Key key}) : super(key: key);
  static String routeName = "/paymentViaExistingCard";

  @override
  ExistingCardsPageState createState() => ExistingCardsPageState();
}

class ExistingCardsPageState extends State<ExistingCardsPage> {
  List cards = [
    {
      'cardNumber': '4242424242424242',
      'expiryDate': '10/24',
      'cardHolderName': 'Malik Zohaib Hassan',
      'cvvCode': '424',
      'showBackView': false,
    },
    {
      'cardNumber': '5555555555554444',
      'expiryDate': '04/23',
      'cardHolderName': 'Afrasiab Khan',
      'cvvCode': '123',
      'showBackView': false,
    }
  ];

  payViaExistingCard(BuildContext context, card) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please Wait...');
    await dialog.show();
    var expiration = card['expiryDate'].split('/');
    CreditCard stripeCard = CreditCard(
        number: card['cardNumber'],
        expMonth: int.parse(expiration[0]),
        expYear: int.parse(expiration[1]));
    StripeTransactionResponse response = await StripeService.payViaExistingCard(
        amount: '150', currency: 'USD', card: stripeCard);
    await dialog.hide();
    Scaffold.of(context)
        .showSnackBar(SnackBar(
          content: Text(response.message),
          duration: new Duration(milliseconds: 1200),
        ))
        .closed
        .then((_) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   floatingActionButton: Container(
    //   height: 60,
    //   width: 60,
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(30), color: Colors.red),
    //   child: IconButton(
    //     icon: Icon(Icons.arrow_forward),
    //     onPressed: () {
    //       Navigator.pushNamed(context, .routeName);
    //     },
    //   ),
    // ),
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text('Choose existing card'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            var card = cards[index];
            return InkWell(
              onTap: () {
                payViaExistingCard(context, card);
              },
              child: CreditCardWidget(
                cardNumber: card['cardNumber'],
                expiryDate: card['expiryDate'],
                cardHolderName: card['cardHolderName'],
                cvvCode: card['cvvCode'],
                showBackView: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
