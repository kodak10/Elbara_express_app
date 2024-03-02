import 'package:elbara_express/presentation/order_success_screen/order_success_screen.dart';
import 'package:elbara_express/presentation/payment_method_screen/payment_method_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PaymentScreen(),
  ));
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choix du mode de paiement'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentMethodScreen()),
                );
              },
              child: Text('Payer maintenant'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderSuccessScreen()),
                );
              },
              child: Text('À la livraison'),
            ),
          ],
        ),
      ),
    );
  }
}
