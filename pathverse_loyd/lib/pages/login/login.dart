import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Text("Welcome! We're happy to see you.",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text("Let's sign you in.",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset("assets/images/logo.png")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 36),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.4),
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.4),
                                    // width: 1.0,
                                  ),
                                ),
                                labelText: "Email Address",
                                fillColor: Colors.white.withOpacity(0.2),
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 9.5, 16, 9.5),
                                labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.white.withOpacity(0.4),
                                      width: 2.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.white.withOpacity(0.4),
                                      // width: 1.0,
                                    ),
                                  ),
                                  labelText: "Password",
                                  fillColor: Colors.white.withOpacity(0.2),
                                  filled: true,
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      16, 9.5, 16, 9.5),
                                  labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  )),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8)),
                              obscureText: !_passwordVisible,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () => {}, child: Text("Log in")),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
