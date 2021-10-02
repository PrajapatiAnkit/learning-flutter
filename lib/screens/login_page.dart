import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  final _formKey = GlobalKey<FormState>();
  submitLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      print('clicked');
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              Image.asset('assets/images/login_image_1.png', fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                'Welcome ${name}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter username",
                      ),
                      validator: (String? username) {
                        if (username != null && username.isEmpty) {
                          return "Enter username";
                        }
                        return null;
                      },
                      onChanged: (username) {
                        setState(() {
                          name = username;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter password",
                      ),
                      validator: (String? password) {
                        if (password != null && password.isEmpty) {
                          return "Enter password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () => submitLogin(context),
                      child: Container(
                        width: 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
