import 'package:flutter/material.dart';
import 'package:signupandloginauth/authentication/authenticationhelper.dart';
import 'package:signupandloginauth/screens/loginscreen.dart';

class signupscreen extends StatefulWidget {
  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  final formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? name;
  bool obscuretext = false;
  bool agree = false;
  final pass = TextEditingController();
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
                      "Create Account",
                      // textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Name",
                        prefixIcon: Icon(Icons.person_outline_outlined),
                      ),
                      onSaved: (val) {
                        name = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter some text";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                      ),
                      onSaved: (val) {
                        email = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter some text";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
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
                                  obscuretext = !obscuretext;
                                });
                              },
                              icon: Icon(
                                obscuretext
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " please enter some text";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        password = val;
                      },
                      obscureText: obscuretext,
                      controller: pass,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: obscuretext,
                      decoration: InputDecoration(
                          hintText: "confirm Password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscuretext = !obscuretext;
                                });
                              },
                              icon: Icon(
                                obscuretext
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ))),
                      validator: (value) {
                        if (value != pass.text) {
                          return "password not match";
                        }
                        if (value!.isEmpty) {
                          return "please enter some text";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                               agree = !agree;
                              });
                            }),
                            
                        Flexible(
                            child: TextButton(
                          child: const Text(
                            "I agree to Terms & Conditions and Privacy Policy",
                            style: TextStyle(fontSize: 13.3),
                          ),
                          onPressed: () {},
                        )),
                      ],
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
                                    .signup(email: email!, password: password!)
                                    .then((result) {
                                  if (result == null) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => loginscreen(),
                                        ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                      result,
                                      style: const TextStyle(fontSize: 16),
                                    )));
                                  }
                                });
                              }
                            },
                            child: const Text("Sign up"))),
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
                                  builder: (context) => loginscreen(),
                                ));
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(color: Colors.black54),
                          )),
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
