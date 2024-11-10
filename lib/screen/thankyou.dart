import 'dart:async';

import 'package:flutter/material.dart';
import 'package:register_kidsclub/screen/start.dart';

class ThankYouPage extends StatefulWidget {
  final String cardCode, bg;
  const ThankYouPage({super.key, required this.cardCode, required this.bg});

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  int counter = 3;
  Timer? timer;
  String bg = 'BG8.png';

  void startTimer(context) {
    counter = 3;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        timer.cancel();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => StartPage(
                rfidCard: widget.cardCode,
                bg: 'en',
              ),
            ),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.bg == 'en') {
      bg = 'BG8.png';
    } else if (widget.bg == 'th') {
      bg = 'th/FinalTH8.jpg';
    } else if (widget.bg == 'chs') {
      bg = 'chs/FinalCHS8.jpg';
    } else if (widget.bg == 'cht') {
      bg = 'cht/FinalCHT8.jpg';
    } else if (widget.bg == 'rs') {
      bg = 'rs/FinalRS8.jpg';
    } else if (widget.bg == 'jp') {
      bg = 'jp/FinalJP8.jpg';
    } else if (widget.bg == 'ar') {
      bg = 'ar/FinalAR8.jpg';
    } else if (widget.bg == 'fr') {
      bg = 'fr/FinalFrench8.jpg';
    } else if (widget.bg == 'kaz') {
      bg = 'kaz/FinalKazakh8.jpg';
    } else if (widget.bg == 'sp') {
      bg = 'sp/FinalSpanish8.jpg';
    } else if (widget.bg == 'vn') {
      bg = 'vn/FinalVietnamese8.jpg';
    } else if (widget.bg == 'heb') {
      bg = 'heb/FinalHebrew8.jpg';
    }
    startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF272A2F),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/$bg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
