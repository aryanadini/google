import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  final User user;


Home(this.user);


  @override
  Widget build(BuildContext context) {


    // try {
    //   final UserCredential userCredential = await auth.signInWithCredential(credential);
    //   final user = userCredential.additionalUserInfo.username;
    //   print(user);
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'account-exists-with-different-credential') {
    //   } else if (e.code == 'invalid-credential') {  }
    // } catch (e) {  }





    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(
            width: 104.58,
            height: 33.19,


        child: Image(image: AssetImage("assets/images/logo1.png"))),

        actions: [
          SizedBox(
              width: 30,
              height: 18,
              child: Text("Hello",style: TextStyle(fontSize: 12,fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color( 0xff161616
              )),)),
          // SizedBox(
          //     width: 112,
          //     height: 18,
          //     child: Text("Hello",style: TextStyle(fontSize: 12,fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color( 0xff161616
          //     )),)),

          SizedBox(
              width: 40,
              height: 40,
            child:    CircleAvatar(backgroundImage: NetworkImage('${user.photoURL}'),),),

       ]
      ),

      body:Column(
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
        ],
      ),



    );
  }
}
