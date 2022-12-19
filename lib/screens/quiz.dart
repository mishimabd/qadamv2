import 'package:flutter/material.dart';
import 'package:qadamv2/data/question_list.dart';
import 'package:qadamv2/screens/result.dart';
import 'package:qadamv2/theme.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  PageController _controller = PageController(initialPage: 0);

  bool _isPressed = false;

  Color _isTrue = Colors.green;
  Color _isFalse = Colors.red;
  Color _btnColor = QadamTheme.textColor07;
  int _score = 0;
  int _pressedIndex = -1;
  int currentQuestion=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.timer),
                  const SizedBox(width: 5),
                  Text('15 min'),
                  Spacer(),
                  Icon(Icons.numbers),
                  const SizedBox(width: 5),
                  Text('${currentQuestion}/${questions.length}'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (page) {
                      setState(() {
                        _isPressed = false;
                        _pressedIndex = -1;
                        currentQuestion+=1;
                      });
                    },
                    controller: _controller,
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            questions[index].question,
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                          for (int i = 0;
                              i < questions[index].answer.length;
                              i++)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: InkWell(
                                onTap: _isPressed
                                    ? () {}
                                    : () {
                                        setState(() {
                                          _isPressed = true;
                                          _pressedIndex = i;
                                        });
                                        if (questions[index]
                                            .answer
                                            .entries
                                            .toList()[_pressedIndex]
                                            .value) {
                                          _score += 1;
                                        }
                                      },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: _isPressed
                                        ? i == _pressedIndex
                                            ? questions[index]
                                                    .answer
                                                    .entries
                                                    .toList()[i]
                                                    .value
                                                ? _isTrue
                                                : _isFalse
                                            : _btnColor
                                        : _btnColor,
                                  ),
                                  child: Text(
                                    questions[index].answer.keys.toList()[i],
                                    style: TextStyle(
                                        color: QadamTheme.textColor02),
                                  ),
                                ),
                              ),
                            ),
                          Spacer(),
                          Center(
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: QadamTheme.textColor07,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                    child: Text(index + 1 == questions.length
                                        ? 'See Results'
                                        : 'Next')),
                                padding: EdgeInsets.all(16),
                                width: double.infinity,
                              ),
                              onTap: _isPressed
                                  ? () {
                                      index + 1 != questions.length
                                          ? _controller.nextPage(
                                              duration:
                                                  Duration(milliseconds: 10),
                                              curve: Curves.linear)
                                          : Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => ResultScreen(score: _score, questionAmount: questions.length,)
                                              ),
                                            );
                                    }
                                  : () {},
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

