import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flowers_app/auth/register.dart';
import 'package:flowers_app/constants/colors.dart';
import 'package:flowers_app/constants/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: Form(
              key: formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  MyTextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Can not be Empty";
                      }
                    },
                    myController: email,
                    hintText: 'Enter your E-mail',
                    isPassword: false,
                    textInputTypee: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  MyTextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Can not be Empty";
                      }
                    },
                    myController: password,
                    hintText: 'Enter your PassWord',
                    isPassword: true,
                    textInputTypee: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      if (email.text == "") {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: "Error",
                          desc: "Please enter your E-mail then press forgot Password",
                        ).show();
                        return;
                      } else {
                        try {
                          await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: "Done",
                            desc: "An E-mail sent to you E-mail to reset your password",
                          ).show();
                        } catch (e) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: "Done",
                            desc: "Please Ensure that you enterd a valid E-mail then reset your password",
                          ).show();
                        }
                      }
                    },
                    child: const Text(
                      "Forgot Password ?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formState.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          Navigator.of(context).pushReplacementNamed("home");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            if (!mounted) return;
                            print('No user found for that email.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: "Error",
                              desc: "No user found for that email.",
                            ).show();
                          } else if (e.code == 'wrong-password') {
                            if (!mounted) return;
                            print('Wrong password provided for that user.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: "Error",
                              desc: "Wrong password provided for that user.",
                            ).show();
                          }
                        }
                      } else {
                        print("Not Valid !");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnGreen,
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account ?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Register(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
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
