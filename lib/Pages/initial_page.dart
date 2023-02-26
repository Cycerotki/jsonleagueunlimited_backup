import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:json_league/Pages/camera_page.dart';
import 'package:json_league/Reuse/Person.dart';

class initialPage extends StatefulWidget {
  const initialPage({Key? key}) : super(key: key);

  @override
  State<initialPage> createState() => _initialPageState();
}

class _initialPageState extends State<initialPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isChecked = false;

  final db = FirebaseFirestore.instance;

  Future<void> getCameras() async {
    print("test");
    await availableCameras().then((value) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraPage(
                  cameras: value,
                ))));
  }

  Future<void> signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text.toString() + "@test.com",
          password: passwordController.text.toString());
      if (credential != null) {
        getCameras();
      }
    } on FirebaseAuthException catch (e) {}
  }

  Future<void> register() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: usernameController.text.toString() + "@test.com",
              password: passwordController.text.toString());
      if (credential != null) {
        //final newUser = <String, dynamic>{};
        final uid = credential.user!.uid;
        final person = Person(uid, usernameController.text);
        db.collection("Person")
            .withConverter(
            fromFirestore: Person.fromFirestore,
            toFirestore: (Person per, options) => per.toFirestore())
            .doc(uid)
            .set(person)
            .onError((error, stackTrace) => print("Error writing document: $error"));
        //await db.collection("users").doc(usernameController.text).set(newUser);
        getCameras();
      }
    } on FirebaseAuthException catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        debugPrint(user.uid);
      }
    });

    getCameras();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Login to your account',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 35),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'abc@example.com',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(16.0),
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 153, 115),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 153, 115)),
                          ),
                        ),
                        controller: usernameController,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: '*********',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(16.0),
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 153, 115),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 153, 115)),
                          ),
                        ),
                        controller: passwordController,
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Checkbox(
                                      value: _isChecked, onChanged: onChanged),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 25),
                          Flexible(
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 0, 84, 152),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 0, 153, 115),
                          ),
                          onPressed: () async {
                            await signIn();
                          },
                          child: const Text("Sign in")),
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor:
                      //           const Color.fromARGB(255, 0, 153, 115),
                      //     ),
                      //     onPressed: () async {
                      //       await register();
                      //     },
                      //     child: const Text("Register")),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 153, 115),
                        ),
                        child: const Text("👀"),
                        onPressed: () async {
                          await getCameras();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void onChanged(bool? value) {
    setState(() {
      _isChecked = value!;
    });
  }
}
