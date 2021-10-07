import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';
import 'dart:developer';

class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({this.message, this.success});
}

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static Uri paymentApiUrl =
      Uri.parse('${StripeService.apiBase}/payment_intents');
  static String secret =
      'sk_test_51HX3aKEDHr1S0m0ArvTvRPUcfpGZrmgSt1p8F6zxDkWqv1jBTYrZ5hQT7MIQTFAml05go0vrLZYmaA50HsAjtZx900MJZGyfaE';
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'ContentType': 'application/x-www-form-urlencoded'
  };
  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51HX3aKEDHr1S0m0AzT2qo7JJB5IBn4ba705RnTG0h4dLPPXjztXb6aUu8PBEe1WMOkNDJ5tg3R6IBqDTYFDi7Bv300xtJdXh7P",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  static Future<StripeTransactionResponse> payViaNewCard(
      {String amount, String currency}) async {
    try {
      PaymentMethod paymentMethod =
          await StripePayment.paymentRequestWithCardForm(
              CardFormPaymentRequest());
      Map<String, dynamic> paymentIntent =
          await StripeService.createPaymentIntent(amount, currency);
      PaymentIntentResult response = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent['client_secret'],
              paymentMethodId: paymentMethod.id));
      //print(jsonEncode(paymentMethod));
      log(response.status);
      if (response.status == 'succeeded') {
        return new StripeTransactionResponse(
            message: 'Transaction Successful', success: true);
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction Failed.', success: false);
      }
    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction1122 Failed: ${err.toString()}', success: false);
    }
  }

  static StripeTransactionResponse getPlatformExceptionErrorResult(err) {
    String message = 'Something went wrong.';
    if (err.code == 'cancelled') message = 'Transaction Cancelled';
    return new StripeTransactionResponse(
        message: message + err.code, success: false);
  }

  static Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(StripeService.paymentApiUrl,
          body: body, headers: StripeService.headers);
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user ${err.toString()}');
    }
    return null;
  }

  static Future<StripeTransactionResponse> payViaExistingCard(
      {String amount, String currency, CreditCard card}) async {
    try {
      PaymentMethod paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: card));
      Map<String, dynamic> paymentIntent =
          await StripeService.createPaymentIntent(amount, currency);
      PaymentIntentResult response = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent['client_secret'],
              paymentMethodId: paymentMethod.id));
      //print(jsonEncode(paymentMethod));
      if (response.status == 'succeeded') {
        return new StripeTransactionResponse(
            message: 'Transaction Successful', success: true);
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction Failed.', success: false);
      }
    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction Failed: ${err.toString()}', success: false);
    }
  }
}
