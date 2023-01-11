import 'package:flutter/material.dart';
import 'package:qadamv2/models/user.dart';
import 'package:qadamv2/services/users_services.dart';
import 'package:qadamv2/theme.dart';
import 'package:qadamv2/util/user_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isInfoSection = true;


  Future<User> init() async {
    final holder = await UserService.validateUser();
    return holder;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: init(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('error');
            }
            if (snapshot.hasData) {
              final user = snapshot.data as User;
              return ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        padding: const EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xff674aef),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    'Back',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                Text(
                                  'Profile',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  onTap: ()async {
                                    await UserService.logOut();
                                    Navigator.of(context).pushReplacementNamed('/login');
                                  },
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04),
                            Center(
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.22,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.21,
                                  backgroundImage: NetworkImage(
                                      'https://i.kym-cdn.com/entries/icons/original/000/026/152/gigachad.jpg'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              user.name ?? "No username",
                              style: TextStyle(fontSize: 22),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Motivation bla bla',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Material(
                                    color: _isInfoSection
                                        ? Color(0xff674aef).withOpacity(0.5)
                                        : Color(0xff674aef),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _isInfoSection = true;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: const Text(
                                          'Info',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Material(
                                    color: _isInfoSection
                                        ? Color(0xff674aef)
                                        : Color(0xff674aef).withOpacity(0.5),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _isInfoSection = false;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: const Text(
                                          'Progress',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (_isInfoSection) ...[
                              Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(user.email ?? 'no email'),
                                    Text(user.name ?? 'no name'),
                                    Text(user.surname ?? 'no surname'),
                                  ],
                                ),
                              )
                            ] else ...[
                              Text('b'),
                              Text('b'),
                            ]
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Text('null');
            }
          }),
    );
  }
}
