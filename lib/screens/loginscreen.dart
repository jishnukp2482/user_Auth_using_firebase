import 'package:flutter/material.dart';

import 'package:signupandloginauth/authentication/authenticationhelper.dart';
import 'package:signupandloginauth/screens/logoutscreen.dart';
import 'package:signupandloginauth/screens/signupscreen.dart';

class loginscreen extends StatefulWidget {
  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool obsecure_text = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Center(
                    child: Text(
                      "Welcome Back!!!",
                      // textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 110,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter some text";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        email = val;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obsecure_text = !obsecure_text;
                                });
                              },
                              icon: Icon(
                                obsecure_text
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ))),
                      obscureText: obsecure_text,
                      onSaved: (val) {
                        password = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter some text";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed:
                                // Respond to button press
                                () {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                authenticationhelper()
                                    .signin(email: email!,password:  password!)
                                    .then((values) {
                                  if (values == null) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => logoutscreen(email: email!),
                                        ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                      values,
                                      style: const TextStyle(fontSize: 16),
                                    )));
                                  }
                                });
                              }
                            },
                            child: const Text("Log in"))),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        const Text("or"),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.blue),
                        ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => signupscreen(),
                                ));
                          },
                          child: const Text("Sign up",style:TextStyle(color: Colors.black54),)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
