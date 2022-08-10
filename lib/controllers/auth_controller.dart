import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kalajam/models/user.dart' as model;
import 'package:simple_logger/simple_logger.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _loggedInUser;
  final ValueNotifier<bool> _userLoggedIn = ValueNotifier(false);

  void addLoginListener(void Function(bool) listener) {
    _userLoggedIn.addListener(() { listener(_userLoggedIn.value); });
  }

  @override
  void onReady() {
    super.onReady();
    _loggedInUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    _loggedInUser.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(
      _loggedInUser,
      (user) {
        _userLoggedIn.value = user != null;
      }
    );
  }

  loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      SimpleLogger().info("Logging in...");
      final credSignedIn =  await FirebaseAuth.instance.signInWithCredential(credential);

      final userDocRef = FirebaseFirestore.instance.collection('users').doc(credSignedIn.user!.uid);
      if (!(await userDocRef.get()).exists) {
        SimpleLogger().info("User (uid: ${credSignedIn.user!.uid} not registered yet.)");
        var user = model.User(
          username: credSignedIn.user!.email!,
          uid: credSignedIn.user!.uid,
        );
        await userDocRef.set(user.toJson());
        SimpleLogger().info("User registered.");
      }
      SimpleLogger().info("Login successful. User: ${credSignedIn.user!.email}");
    } catch (e) {
      Get.snackbar("Error while logging in", e.toString());
      SimpleLogger().shout("Error during login: ${e.toString()}");
    }
  }
}
