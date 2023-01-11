import 'package:flutter/material.dart';
import 'package:qadamv2/services/users_services.dart';
import 'package:qadamv2/theme.dart';
import '../models/user.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({Key? key}) : super(key: key);

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
                showDialog(
                    context: context, builder: (context) => ShowUserDialog());
              },
              child: Text('Показать челиков'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => ShowOneUserDialog());
              },
              child: Text('Показать одного челика'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowOneUserDialog extends StatelessWidget {
  ShowOneUserDialog({Key? key}) : super(key: key);

  final _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: QadamTheme.textColor08,
      title: Text('Показать одного юзера'),
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
              controller: _idController,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w400),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'ID',
                hintStyle:
                    TextStyle(color: QadamTheme.textColor04, fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final user = await UserService.getUser(_idController.text);
            _idController.text = '';
            showDialog(
              context: context,
              builder: (context) => OneUserDialog(user: user),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(QadamTheme.textColor07),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text('Показать'),
        )
      ],
    );
  }
}

class OneUserDialog extends StatelessWidget {
  final User user;

  const OneUserDialog({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: QadamTheme.textColor08,
      title: Text('User'),
      content: Container(
        child: Text(
            'id: ${user.iD}\nname: ${user.name} \nsurname: ${user.surname}\nemail: ${user.email}\npassword: ${user.password}\nCreatedAt: ${user.createdAt}\nUpdatedAt: ${user.updatedAt}\nDeletedAt: ${user.deletedAt}'),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Назад'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(QadamTheme.textColor07),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        )
      ],
    );
  }
}

class ShowUserDialog extends StatefulWidget {
  const ShowUserDialog({Key? key}) : super(key: key);

  @override
  State<ShowUserDialog> createState() => _ShowUserDialogState();
}

class _ShowUserDialogState extends State<ShowUserDialog> {
  List users = [];

  Future<void> fetchUsers() async {
    final response = await UserService.fetchPosts();
    if (response != null) {
      setState(() {
        users = response;
      });
    } else {
      print('Error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: QadamTheme.textColor08,
      title: const Text('Users'),
      actionsPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      actions: [
        ElevatedButton(
          onPressed: () {
            fetchUsers();
          },
          child: Text('Обновить'),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(QadamTheme.textColor07),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
        )
      ],
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      content: Visibility(
        visible: users.isNotEmpty,
        replacement: Center(
          child: Text('Sorry bro no users((('),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width,
          ),
          child: Table(
            border: TableBorder.all(width: 1, color: Colors.white),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            defaultColumnWidth: IntrinsicColumnWidth(),
            children: List<TableRow>.generate(
              users.length,
              (index) {
                final user = users[index] as Map;
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        user['ID'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Text(user['name'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11)),
                    Text(user['surname'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11)),
                    Text(user['Email'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11)),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DeleteUserDialog extends StatelessWidget {
  DeleteUserDialog({Key? key}) : super(key: key);

  @override
  final idcontroller = TextEditingController();
  final idFocusController=FocusNode();

  Future<void> deleteUserById(String id) async {
    final isSuccess = await UserService.deleteUserById(id);
    if (isSuccess) {
      print('User successfully deleted!');
      idcontroller.text='';
    } else {
      print('Error');
    }
  }

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
              focusNode:idFocusController ,
              controller: idcontroller,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w400),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'ID',
                hintStyle:
                    TextStyle(color: QadamTheme.textColor04, fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            deleteUserById(idcontroller.text);
            FocusScope.of(context).requestFocus(idFocusController);
          },
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

class CreateUserDialog extends StatefulWidget {
  CreateUserDialog({Key? key}) : super(key: key);

  @override
  State<CreateUserDialog> createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends State<CreateUserDialog> {
  final nameController = TextEditingController();

  final surnameController = TextEditingController();

  final emailController = TextEditingController();

  Future<void> createUser() async {
    final name = nameController.text;
    final surname = surnameController.text;
    final email = emailController.text;
    final body = {"name": name, "surname": surname, "Email": email};
    await UserService.createUser(body) ? print('success') : print('og no ');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: QadamTheme.textColor08,
      title: const Text('Создание юзера'),
      actionsPadding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
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
            createUser();
            Navigator.pop(context);
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
