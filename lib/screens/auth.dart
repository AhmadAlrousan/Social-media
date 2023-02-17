import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/screens/Layout_Screen.dart';
import 'package:social_media/screens/login%20test.dart';


class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges()
        , builder: ((context , snapshot){
          if(snapshot.hasData){
            return SocialLayout();
          } else {
            return Login();
          }
      })

      ),
    );
  }
}
