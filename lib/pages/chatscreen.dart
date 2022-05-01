import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text('Coming Soon..!',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          )),
    ));
  }
}
