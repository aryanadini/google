import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:posthub/home.dart';



class Onboard extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
      await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print("Error during Google sign-in: $error");
      return null;
    }
  }

   Onboard({super.key});


  // void initState() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
children: [
  Positioned(
      width: 161.42,
      height: 51.24,
      top: 70,
      left: 99,


      child: Image(image: AssetImage("assets/images/logo1.png"))),

  Positioned(
      width: 322,
      height: 264,
      top: 128,
      left: -2,



      child:Image(image: AssetImage("assets/images/onboard1.png")) ),
  Positioned(
      width: 321,
      height: 66,
      top: 423,
      left: 15,


      child: Text("Hassle free Cross Platform Digital Advertisement ",style: TextStyle
        (fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
        fontSize:22,
        color:Color(0xff161616),
      ),


      )),


 Positioned(
     width: 321,
     height: 84,
     top: 502,
     left: 15,


     child: Text("Hassle free Cross Platform Digital Advertisement to boost your sale avoid mistakes while running campaign we take care for you ",
     style: TextStyle(
       fontWeight: FontWeight.w400,fontFamily: 'Poppins',
       fontSize: 14,
       color: Color(0xff161616),
     ),

     )),
  Positioned(
      width:328,
      height: 40,
        top: 628,

    left: 16,

    child:ElevatedButton(onPressed: ()async {
    User? user = await _handleSignIn();

    if (user != null) {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => UserDetailsPage(user) ,
    ));
    }
    // if (user != null) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Home(),
    //       ));
    // }


    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    }, child: Text("Sign In with Google")

    ),


    ),

],

      ),
    );
  }
}
class UserDetailsPage extends StatelessWidget {
  final User user;

  UserDetailsPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Text("User Details"),
        actions: [
          SizedBox(
            width: 30,
            height: 18,
       child:    CircleAvatar(backgroundImage: NetworkImage('${user.photoURL}'),),
      ) ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 124,
              height: 27,
              child:Text("Quick Access",style:TextStyle(fontSize: 18) ,) ,

            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}