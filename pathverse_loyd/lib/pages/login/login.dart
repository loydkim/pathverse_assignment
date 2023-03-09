import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
import 'package:pathverse_loyd/common/utils/functions.dart';
import 'package:pathverse_loyd/pages/home_landing/home_landing.dart';
import 'package:pathverse_loyd/pages/login/widgets/auth_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

/// Try to make a similar original pathverse log-in page.
class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Text("Welcome! We're happy to see you.",
                        style: AppTextTheme.styleW700.copyWith(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.4))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text("Let's sign you in.",
                            style: AppTextTheme.styleW700.copyWith(
                                fontSize: 30,
                                color: Colors.white,
                                letterSpacing: 1)),
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
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 36),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AuthTextField(
                                  labelText: "Email Address",
                                  validator: PathverseFunctions.validateEmail),
                              const SizedBox(
                                height: 20,
                              ),
                              AuthTextField(
                                labelText: "Password",
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "This field can't be empty!";
                                  }
                                  return null;
                                },
                                suffixIcon: GestureDetector(
                                  child: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                obscureText: !_passwordVisible,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 46,
                                child: ElevatedButton(
                                    onPressed: () => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeLanding(),
                                              ))
                                            }
                                        },
                                    child: Text(
                                      "Log in",
                                      style: AppTextTheme.styleW700
                                          .copyWith(fontSize: 20),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
