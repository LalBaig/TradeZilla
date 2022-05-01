import 'package:flutter/material.dart';
import 'package:trade_zilla/utilities/colors.dart';

class BrandDivider extends StatelessWidget {
  const BrandDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 0.5,
      color: grey,
    );
  }
}
