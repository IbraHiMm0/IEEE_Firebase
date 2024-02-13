import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iee/Homescreen.dart';

import 'LoginScreen.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
// ==================================================
// TextEditingController email=TextEditingController();
// TextEditingController pass=TextEditingController();

  TextEditingController emaill = TextEditingController();
  TextEditingController passs = TextEditingController();
// ==================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.wallpapersden.com/image/download/night-mountains-summer-illustration_a2plamaUmZqaraWkpJRnbmhnrWduaGc.jpg"
            ),
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
                  const Text('Signup',
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
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      disabledBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black45
                          ),
                          borderRadius:BorderRadius.circular(10)

                      ),
                      enabledBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70
                          ),
                          borderRadius:BorderRadius.circular(10)

                      ),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red
                          ),
                          borderRadius:BorderRadius.circular(10)

                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.redAccent,
                      ),
                      labelText: 'User Name',
                      labelStyle: TextStyle(
                          color: Colors.black
                      ),

                    ),

                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: emaill,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      disabledBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black45
                          ),
                          borderRadius:BorderRadius.circular(10)

                      ),
                      enabledBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70
                          ),
                          borderRadius:BorderRadius.circular(10)

                      ),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red
                          ),
                          borderRadius:BorderRadius.circular(10)

                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.redAccent,
                      ),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                          color: Colors.black
                      ),

                    ),
                    // ================================
                    // controller: email,
                    // ==============================
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: passs,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      disabledBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black45
                          ),
                          borderRadius:BorderRadius.circular(10)

                      ),
                      enabledBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white70
                          ),
                          borderRadius:BorderRadius.circular(10)

                      ),
                      focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red
                          ),
                          borderRadius:BorderRadius.circular(10)

                      ),

                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.redAccent,
                      ),
                      suffix: Icon(
                        Icons.remove_red_eye ,
                        color: Colors.white70,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.black
                      ),

                    ),
                    // ==============================
                    // controller: pass,
                    // =================================
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Container(

                    width: double.infinity,
                    color: Color(0xFFab4747),
                    child: TextButton(
                      onPressed: () async{
                        // ====================From docs ============================
                        // try {
                        //   print('clicked');
                        //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        //     email: email.text,
                        //     password: pass.text,
                        //   );
                        // } on FirebaseAuthException catch (e) {
                        //   if (e.code == 'weak-password') {
                        //     print('The password provided is too weak.');
                        //   } else if (e.code == 'email-already-in-use') {
                        //     print('The account already exists for that email.');
                        //   }
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => HomePage()));
                        // } catch (e) {
                        //   print(e);
                        // }
                        try {
                          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emaill.text,
                            password: passs.text,
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  HomePage()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }






















                        // ====================================================
                      },
                      style:ButtonStyle(
                        shape:MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        )),

                      ),
                      child: const Text(
                        'Register' ,
                        style:TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Roboto'
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already Have an Account ?',
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }, child: const Text(
                        'Login Now',
                        style: TextStyle(
                            color: Colors.deepOrangeAccent
                        ),
                      ),)
                    ],
                  ),



                ],
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
