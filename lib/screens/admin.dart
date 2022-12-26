import 'package:flutter/material.dart';
import 'package:qadamv2/theme.dart';

import '../models/user.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({Key? key}) : super(key: key);

  var userController = UserController(UserRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context, builder: (context) => CreateUserDialog());
              },
              child: Text('Создать пользователя'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context, builder: (context) => DeleteUserDialog());
              },
              child: Text('Удалить пользователя'),
            ),
            ElevatedButton(
              onPressed: () {
                userController.fetchUserList();
              },
              child: Text('Чето еще'),
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteUserDialog extends StatelessWidget {
  DeleteUserDialog({Key? key}) : super(key: key);

  @override
  final idcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: QadamTheme.textColor08,
      title: Text('Удаление юзера'),
      actionsPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      actions: [
        Container(
          decoration: BoxDecoration(
              color: QadamTheme.textColor02,
              border: Border.all(color: QadamTheme.textColor03, width: 0.5),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: TextField(
              controller: idcontroller,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w400),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'ID',
                hintStyle:
                    TextStyle(color: QadamTheme.textColor04, fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: Text('Удалить'),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(QadamTheme.textColor07),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
        )
      ],
    );
  }
}

class CreateUserDialog extends StatelessWidget {
  CreateUserDialog({Key? key}) : super(key: key);

  final nameController = TextEditingController();

  final surnameController = TextEditingController();

  final emailController = TextEditingController();

  var userController = UserController(UserRepository());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: QadamTheme.textColor08,
      title: Text('Создание юзера'),
      actionsPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      actions: [
        Container(
          decoration: BoxDecoration(
              color: QadamTheme.textColor02,
              border: Border.all(color: QadamTheme.textColor03, width: 0.5),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: TextField(
              controller: nameController,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w400),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',
                hintStyle:
                    TextStyle(color: QadamTheme.textColor04, fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: QadamTheme.textColor02,
              border: Border.all(color: QadamTheme.textColor03, width: 0.5),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: TextField(
              controller: surnameController,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w400),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Surname',
                hintStyle:
                    TextStyle(color: QadamTheme.textColor04, fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: QadamTheme.textColor02,
              border: Border.all(color: QadamTheme.textColor03, width: 0.5),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: TextField(
              controller: emailController,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w400),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                hintStyle:
                    TextStyle(color: QadamTheme.textColor04, fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            print(
                'name : ${nameController.text}  surname : ${surnameController.text}  email : ${emailController.text}');
            print(
              userController.postUser(
                User(
                  iD: 18,
                  name: nameController.text,
                  surname: surnameController.text,
                  email: emailController.text,
                  password: 'password',
                  createdAt: '2022-12-22T00:00:00Z',
                  deletedAt: '2022-12-22T00:00:00Z',
                  updatedAt: '2022-12-22T00:00:00Z',
                ),
              ),
            );
          },
          child: Text('Создать'),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(QadamTheme.textColor07),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
        )
      ],
    );
  }
}
