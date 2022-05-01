import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trade_zilla/utilities/colors.dart';

class loading_spin extends StatelessWidget {
  const loading_spin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: organeColor,
      child: Center(
        child: SpinKitWanderingCubes(
          color: whtColor,
          size: 40,
        ),
      ),
    );
  }
}
