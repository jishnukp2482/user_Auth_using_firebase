import 'package:flutter/material.dart';
import 'package:signupandloginauth/screens/loginscreen.dart';

class logoutscreen extends StatelessWidget {
  final String email;
  logoutscreen({required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
             Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Center(
                    child: Text(
                      "Welcome $email",
                      maxLines: 2,
                      // textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => loginscreen(),
                                  ));
                            },
                            child: const Text(
                              "Log out",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
               ),
                
              
          ],
        ),
      ),
    );
  }
}
