import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iee/LoginScreen.dart';
import 'package:iee/card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController f = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ====(make it allow and restart)================firestore go to docs=======
    CollectionReference reports =
        FirebaseFirestore.instance.collection('food');

    Future<void> addReport() async {
       reports.add({
        'flavor': f.text,
        // ==============arrow method & curly=======
      }).then((value) {
        print("Food Added");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Cardview()));
      }).catchError((error) {
        print("Failed to add Report: $error");
      });
    }

    // ==============================
    return Scaffold(
      backgroundColor: const Color(0xFFf5f6fa),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 35.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Report App',
                    style: TextStyle(fontSize: 25, color: Colors.redAccent),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35.0,
              ),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: List.filled(
                              1,
                              const BoxShadow(
                                  blurRadius: 20,
                                  color: Colors.black12,
                                  offset: Offset(7, 5)))),
                      child: TextFormField(
                        // style: getRegularStyle(color: Colors.grey,fontSize: 20),
                        style: const TextStyle(
                          fontSize: 20,
                          height: 1,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                            hintText: 'Add your Report here',
                            hintStyle: const TextStyle(
                                color: Colors.black26,
                                fontStyle: FontStyle.italic),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 10),
                              child: Icon(
                                Icons.access_time,
                                size: 35,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            )),
                        controller: f,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 35.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    addReport();
                  },
                  child: const Text(
                    'send',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),

              const SizedBox(
                height: 30.0,
              ),
              // =======================================
              ElevatedButton(
                  onPressed: () {
                    // ============signout===========
                    print('signout');
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                    // =======================
                  },
                  child: const Text(
                    'signout',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
              // =============================================

              const SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
