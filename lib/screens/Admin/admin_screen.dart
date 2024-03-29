import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:johor_wheels/screens/Admin/createuserscreen.dart';
import 'package:johor_wheels/screens/Admin/edituserdata.dart';
import 'package:flutter/material.dart';
import 'package:johor_wheels/auth_services.dart';
import 'package:johor_wheels/screens/Welcome/welcome_screen.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController emailController = new TextEditingController();

  String email = " ";
  String uid = " ";
  String role = " ";
  String password = " ";

  bool ableToEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome Admin"),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          GestureDetector(
            onTap: () async {
              String userEmail = emailController.text.trim();

              final QuerySnapshot snap = await FirebaseFirestore.instance
                  .collection('users')
                  .where('email', isEqualTo: userEmail)
                  .get();
              setState(() {
                email = userEmail;
                uid = snap.docs[0]['uid'];
                role = snap.docs[0]['role'];
                password = snap.docs[0]['password'];

                ableToEdit = true;
              });
            },
            child: Container(
              height: 50,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Get User Data",
                ),
              ),
            ),
          ),
          ableToEdit
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditUser(
                                  uid: uid,
                                )));
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        "Edit User",
                      ),
                    ),
                  ),
                )
              : Container(),
          GestureDetector(
            onTap: () async {
              AuthServices.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            child: Container(
              height: 50,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Sign out",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text('User Data :'),
          SizedBox(
            height: 50,
          ),
          Text('Email : ' + email),
          Text('UID : ' + uid),
          Text('Role : ' + role),
          Text('Password : ' + password),
        ],
      ),
    );
  }
}
