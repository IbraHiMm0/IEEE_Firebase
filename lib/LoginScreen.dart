import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iee/Homescreen.dart';

import 'Signup.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController email =TextEditingController();
    // TextEditingController pass =TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.wallpapersden.com/image/download/night-mountains-summer-illustration_a2plamaUmZqaraWkpJRnbmhnrWduaGc.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xFFe5e5e5),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.redAccent,
                      ),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    controller: email,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black45),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.redAccent,
                      ),
                      suffix: Icon(
                        Icons.remove_red_eye,
                        color: Colors.white70,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    controller: password,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          // onPressed: () async {
                          //   // =================Not from Docs========================
                          //   await FirebaseAuth.instance
                          //       .sendPasswordResetEmail(email: email.text);
                          //   print('check your email');
                          //   // =======================================================
                          // },







                        onPressed: () async{
                          await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);

                        },


















                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Color(0xFFab4747),
                    child: TextButton(
                      onPressed: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text, password: password.text);

                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                        } on FirebaseAuthException catch (e) {
                          print(e.code);
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.g_mobiledata,
                          size: 50,
                          color: Colors.yellow,
                        ),
                        TextButton(
                          onPressed: () {
                            signInWithGoogle();
                          },
                          style: ButtonStyle(
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                          ),
                          child: const Text(
                            's with Google',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t Have an Account ?',
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );
//
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
//
//   //==================50EGP=============
// }
}
