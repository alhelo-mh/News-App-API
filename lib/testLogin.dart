// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TestLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEST'),
        elevation: 0.0,
        titleSpacing: 20.0,
        backgroundColor: const Color.fromARGB(255, 1, 28, 187),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color.fromARGB(255, 1, 28, 186),
            Color.fromARGB(255, 211, 223, 238),
          ],
          tileMode: TileMode.mirror,
        )),
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
                        fontSize: 50,
                        color: Color.fromARGB(255, 211, 223, 238)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Name',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(126, 0, 0, 0),
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Email',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(126, 0, 0, 0),
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your phone',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(126, 0, 0, 0),
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an accont'),
                      TextButton(
                          onPressed: () {}, child: const Text('Register Now')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
