import 'package:flutter/material.dart';

import '../screens/course.dart';

class BuilderItem2 extends StatelessWidget {
  final String item;

  const BuilderItem2({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CourseScreen(item: item)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            color: Color(0xfff5f3f3), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/$item.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
