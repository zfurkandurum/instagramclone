import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class webScreenLayout extends StatefulWidget {
  const webScreenLayout({super.key});

  @override
  State<webScreenLayout> createState() => _webScreenLayoutState();
}

class _webScreenLayoutState extends State<webScreenLayout> {
  String username = "";

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snapshot.data() as Map<String, dynamic>)["username"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("this is web")),
    );
  }
}
