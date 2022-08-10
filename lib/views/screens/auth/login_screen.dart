import 'package:flutter/material.dart';
import 'package:kalajam/style.dart';
import 'package:kalajam/controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "KalaJam",
              style: TextStyle(
                fontSize: 35,
                color: KalaStyle.kalaBlue,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 25,),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/18,
                margin: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: KalaStyle.kalaBlue,
                ),
                child: Center(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/google.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )
                      )
                    ],
                  )
                )
              ),
              onTap: () async {
                await AuthController.instance.loginWithGoogle();
              },
            )
          ],
        )
      ),
    );
}
