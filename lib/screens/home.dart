import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:qadamv2/theme.dart';
import '../widgets/builderItem2.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List catNames = [
    'Category',
    'Classes',
    'Quizzes',
    'BookStore',
    'Live Course',
    'LeaderBoard',
  ];

  List catRoutes = [
    '/home',
    '/home',
    '/quiz',
    '/home',
    '/home',
    '/home',
  ];

  List<Color> catColors = const [
    Color(0xffffcf2f),
    Color(0xff6fe08d),
    Color(0xff61bdfd),
    Color(0xfffc7f7f),
    Color(0xffcb84fb),
    Color(0xff78e667),
  ];

  List<Icon> catIcons = const [
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Icon(Icons.store, color: Colors.white, size: 30),
    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];



  List imgList = ['Flutter', 'React Native', 'Python', 'C#'];

  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: const BoxDecoration(
              color: Color(0xff674aef),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.dashboard,
                        size: 30,
                      ),
                      onTap: () {
                        ZoomDrawer.of(context)!.toggle();
                      },
                    ),
                    Icon(
                      Icons.notifications,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    'Hi, Programmer',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    focusNode: focus,
                    style: TextStyle(color: QadamTheme.textColor04),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search here....',
                      prefixIcon: Icon(
                        Icons.search,
                        color: QadamTheme.textColor04,
                      ),
                      hintStyle: TextStyle(color: QadamTheme.textColor04),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (!focus.hasFocus) ...[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 20, right: 15),
              child: Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: catNames.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: catColors[index],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: catIcons[index],
                              ),
                            ),
                            onTap: (){
                              Navigator.of(context).pushNamed(catRoutes[index]);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            catNames[index],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: QadamTheme.textColor02),
                          )
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Courses',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: QadamTheme.textColor06),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    itemCount: imgList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            (MediaQuery.of(context).size.height - 50 - 25) /
                                (4 * 240),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return BuilderItem2(item: imgList[index]);
                    },
                  ),
                ],
              ),
            ),
          ] else ...[
            ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Last Search...',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Divider(
                          thickness: 2,
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ]
        ],
      ),
    );
  }
}
