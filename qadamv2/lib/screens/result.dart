import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qadamv2/theme.dart';

class ResultScreen extends StatefulWidget {
  final int questionAmount;
  final int score;

  ResultScreen({Key? key, required this.score, required this.questionAmount})
      : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isPlaying = false;

  final _controller = ConfettiController();

  @override
  void initState() {
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.stop();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                const SizedBox(),
                CircularPercentIndicator(
                  radius: 100,
                  lineWidth: 20,
                  percent: (widget.score / widget.questionAmount),
                  backgroundColor: QadamTheme.textColor08.withOpacity(0.3),
                  progressColor: QadamTheme.textColor08,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text('${widget.score} / ${widget.questionAmount}', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pushReplacementNamed('/home');
                }, child: Text('go home'), style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(QadamTheme.textColor08)
                ),),
                const SizedBox()
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          gravity: 0.01,
          colors: [
            Colors.white,
            Colors.indigo,
            Colors.cyan,
            Colors.amberAccent,
            Colors.blue,
            Colors.orangeAccent
          ],
        ),
      ],
    );
  }
}
