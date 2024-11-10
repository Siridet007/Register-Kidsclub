
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoadTest extends StatefulWidget {
  const LoadTest({super.key});

  @override
  State<LoadTest> createState() => _LoadTestState();
}

class _LoadTestState extends State<LoadTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/BG0.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(child: _typer()),
                  const SizedBox(height: 30),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _typer() {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 40.0,
        color: Colors.white,
        fontFamily: 'kid',
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(
            'PROCESSING................. ',
          ),
        ],
        isRepeatingAnimation: true,
        totalRepeatCount: 10004,
        onTap: () {},
      ),
    );
  }
}