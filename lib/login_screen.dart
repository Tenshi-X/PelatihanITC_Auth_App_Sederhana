import 'package:auth_firebase/home_screen.dart';
import 'package:auth_firebase/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              obscureText: true,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 75, right: 75, top: 30),
            child: ElevatedButton(
                child: Text('Login'),
                onPressed: () async {
                  try {
                    await _firebaseAuth
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then((value) => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => searchScreen()))
                            });
                  } catch (e) {
                    print(e);
                  }
                }),
          ),
          Container(
            margin: EdgeInsets.only(left: 75, right: 75, bottom: 20),
            child: ElevatedButton(
                onPressed: (() async {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                }),
                child: Text('Register')),
          )
        ],
      ),
    );
  }
}
