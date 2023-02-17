import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var fromKey = GlobalKey<FormState>();
  var passwordC = TextEditingController();
  var emailC = TextEditingController();
  bool isv = true;
  bool isv2 = false;

  void dispose(){
    super.dispose();
    emailC.dispose();
    passwordC.dispose();
  }
  Future login()async{
    await FirebaseAuth.instance.
    signInWithEmailAndPassword
      (email: emailC.text.trim(),
        password: passwordC.text.trim());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: emailC,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "email",
            ),
          ),
          TextField(
            controller: passwordC,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "password",
            ),
          ),
          ElevatedButton(
            onPressed: login,
            child: Text("Login"),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              fixedSize: Size(double.maxFinite, 50),
            ),
          ),
        ],
      ),
    );
  }
}
