import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "followers": followers,
        "following": following,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapsort = snap.data() as Map<String, dynamic>;
    print(snapsort.toString());
    return User(
      username: snapsort["Username"],
      uid: snapsort["UID"],
      email: snapsort["email"],
      photoUrl: snapsort["profileUrl"],
      bio: snapsort["bio"],
      followers: snapsort["followers"],
      following: snapsort["following"],
    );
  }
}