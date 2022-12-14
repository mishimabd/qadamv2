import 'package:flutter/material.dart';

import '../theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool value = false;
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/login');
                          },
                          child:Icon(
                            Icons.close,
                            color: QadamTheme.textColor03,
                            size: 20,
                          ),
                        ),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/login');
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: QadamTheme.textColor05,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: QadamTheme.textColor02,
                          border: Border.all(
                              color: QadamTheme.textColor03, width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          focusNode: _nameFocus,
                          onSubmitted: (String text){
                            _emailFocus.requestFocus();
                          },
                          obscureText: false,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            hintText: "Name",
                            hintStyle: TextStyle(
                                color: QadamTheme.textColor04, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: QadamTheme.textColor02,
                          border: Border.all(
                              color: QadamTheme.textColor03, width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          focusNode: _emailFocus,
                          onSubmitted: (String text){
                            _passwordFocus.requestFocus();
                          },
                          obscureText: false,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(
                                color: QadamTheme.textColor04, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: QadamTheme.textColor02,
                          border: Border.all(
                              color: QadamTheme.textColor03, width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          focusNode: _passwordFocus,
                          obscureText: true,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: QadamTheme.textColor04, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.black,
                          fillColor:MaterialStateProperty.all(Colors.white),
                          value: this.value,
                          onChanged: (bool? value) {
                            setState(
                                  () {
                                this.value = value!;
                              },
                            );
                          },
                        ),
                        Expanded(
                          child: Text(
                            "I would like to recieve your newsletter and other promotional information",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: QadamTheme.textColor02),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        /// Navigation to main screen
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: QadamTheme.textColor05,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(100))),
                        width: double.infinity,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: QadamTheme.textColor05,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
