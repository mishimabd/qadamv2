import 'package:flutter/material.dart';
import 'package:qadamv2/theme.dart';

import '../widgets/desctiption_section.dart';
import '../widgets/lessons_section.dart';

class CourseScreen extends StatefulWidget {
  final String item;
  const CourseScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool _isLessonsSection = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.item,
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 28),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: QadamTheme.textColor02,
                image:  DecorationImage(
                  image: AssetImage('assets/images/${widget.item}.png'),
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xff674aef),
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Flutter Complete Course',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Created by Abdullaev Alisher',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              '55 Videos',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: QadamTheme.textColor03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: _isLessonsSection
                        ? Color(0xff674aef).withOpacity(0.5)
                        : Color(0xff674aef),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isLessonsSection = true;
                        });
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                        child: const Text(
                          'Lessons',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: _isLessonsSection
                        ? Color(0xff674aef)
                        : Color(0xff674aef).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isLessonsSection = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
                        child: const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _isLessonsSection? LessonsSection(item: widget.item): DescriptionSection(),
          ],
        ),
      ),
    );
  }
}
