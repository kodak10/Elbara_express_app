import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

void showCustomSnackBar(BuildContext context, String message, {bool isError = false}) {
  final snackBar = SnackBar(
    content: AwesomeSnackbarContent(
      title: isError ? 'Erreur' : 'Information',
      message: message,
      contentType: isError ? ContentType.failure : ContentType.success,
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
    duration: Duration(seconds: 5), // Temps d'affichage du snackbar
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
