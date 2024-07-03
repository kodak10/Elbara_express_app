import 'package:elbara_express/core/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitWave(
          color: ColorConstant.bleuElbara,
          size: 40.0,
        ),
      ),
    );
  }
}
