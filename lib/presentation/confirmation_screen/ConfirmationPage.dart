import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConfirmationPage extends StatelessWidget {
  final String verificationId;
  final TextEditingController smsCodeController = TextEditingController();

  ConfirmationPage(this.verificationId);

  void signInWithPhoneNumber(String smsCode) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
      print('Authentification réussie');
    } catch (e) {
      print('Erreur lors de l\'authentification : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: smsCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Code SMS'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => signInWithPhoneNumber(smsCodeController.text),
              child: Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
