import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.username,
    required this.uid,
  });

  final String username;
  final String uid;

  static User fromSnapshot(DocumentSnapshot snap) {
    final map = snap as Map<String, dynamic>;

    return User(
      username: map['username'],
      uid: map['uid'],
    );
  }

  Map<String, dynamic> toJson() => {
    'username': username,
    'uid': uid,
  };
}
