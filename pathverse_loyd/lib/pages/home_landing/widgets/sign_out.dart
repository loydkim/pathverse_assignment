import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
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
              Container(
                width: double.infinity,
                height: 320,
                decoration: BoxDecoration(
                    color: Colors.red.shade300.withOpacity(0.16),
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red.shade300.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: const Offset(0, 1)),
                    ]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.logout_outlined,
                        size: 60,
                        color: Colors.red.shade300,
                      ),
                    ),
                    Text("Sign Out",
                        style: AppTextTheme.styleW700.copyWith(fontSize: 26)),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: Text("Would you like to sign out?"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            backgroundColor: Colors.red.shade500),
                        child: Text("Sign Out",
                            style:
                                AppTextTheme.styleW700.copyWith(fontSize: 16)))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
