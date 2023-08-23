// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoURL;
  final String username;
  final String bio;
  final List followers;
  final List following;

  User({
    required this.email,
    required this.uid,
    required this.photoURL,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': followers,
        'following': following,
        'photoURL': photoURL,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      bio: snapshot["bio"],
      email: snapshot["email"],
      followers: snapshot["followers"],
      following: snapshot["following"],
      photoURL: snapshot["photoURL"],
    );
  }
}
