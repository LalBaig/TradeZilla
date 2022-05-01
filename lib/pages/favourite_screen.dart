import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text('No Item Added',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          )),
    ));
  }
}
