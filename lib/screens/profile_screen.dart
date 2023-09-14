import 'package:flutter/material.dart';
import 'package:instagramclone/utils/color.dart';
import 'package:instagramclone/utils/utils.dart';
import 'package:instagramclone/widgets/follow_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;

  const ProfileScreen({super.key, required this.uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData = {};
  int postlen = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      DocumentSnapshot userSnap = await FirebaseFirestore.instance
          .collection("users")
          .doc(widget.uid)
          .get();

      //get post
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      postlen = postSnap.docs.length;
      userData = userSnap.data() as Map<dynamic, dynamic>;
      followers = userSnap['followers'].length;
      following = userSnap['following'].length;
      isFollowing =
          (userSnap.data() as Map<String, dynamic>).containsKey('followers') &&
              (userSnap.data() as Map<String, dynamic>)['followers']
                  .contains(FirebaseAuth.instance.currentUser!.uid);

      setState(() {});
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text(userData['username'] ?? ''),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                        userData['photoURL'] ?? '',
                      ),
                      radius: 40,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildStatColumn(postlen, "posts"),
                          buildStatColumn(followers, "followers"),
                          buildStatColumn(following, "following"),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FirebaseAuth.instance.currentUser!.uid == widget.uid
                        ? Followbutton(
                            backgroundColor: mobileBackgroundColor,
                            borderColor: Colors.grey,
                            text: 'Edit profile',
                            textColor: primaryColor,
                            function: () {},
                          )
                        : isFollowing
                            ? Followbutton(
                                backgroundColor: Colors.white,
                                borderColor: Colors.grey,
                                text: 'Unfollow',
                                textColor: Colors.black,
                                function: () {},
                              )
                            : Followbutton(
                                backgroundColor: Colors.blue,
                                borderColor: Colors.blue,
                                text: 'Follow ',
                                textColor: Colors.white,
                                function: () {},
                              )
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    userData['username'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    userData['bio'] ?? '',
                    style: const TextStyle(),
                  ),
                )
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
