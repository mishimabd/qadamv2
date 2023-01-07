import 'package:flutter/material.dart';

class LessonsSection extends StatelessWidget {
  final String item;

  LessonsSection({Key? key, required this.item}) : super(key: key);

  final List lessons = [
    'Inroduction to Flutter',
    'Installing flutter',
    'setup',
    'Inroduction to Flutter',
    'Installing flutter',
    'setup',
    'Inroduction to Flutter',
    'Installing flutter',
    'setup',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index < 4
                  ? Color(0xff674aef)
                  : Color(0xff674aef).withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(lessons[index]),
          subtitle: Text('20 mins'),

        );
      },
    );
  }
}
