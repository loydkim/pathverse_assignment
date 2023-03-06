import 'package:flutter/material.dart';
import 'package:pathverse_loyd/pages/login/login.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text("Sign Out",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: Text("Would you like to sign out?"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
                  },
                  child: const Text("Sign Out"))
            ],
          ),
        ));
  }
}
