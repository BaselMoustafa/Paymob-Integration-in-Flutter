import 'package:flutter/material.dart';
import 'package:flutter_paymob_integration/paymob_manager/paymob_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paymob Integration"),),
      body: ElevatedButton(
        onPressed: ()async=>_pay(), 
        child: const Text("Pay 10 EGP"),
      ),
    );
  }

  Future<void> _pay() async{
    PaymobManager().getPaymentKey(
      10,"EGP"
    ).then((String paymentKey) {
      launchUrl(
        Uri.parse("https://accept.paymob.com/api/acceptance/iframes/791787?payment_token=$paymentKey"),
      );
    });
    
  } 
}