import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flowers_app/auth/login.dart';
import 'package:flowers_app/constants/colors.dart';
import 'package:flowers_app/constants/custom_text_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController username = TextEditingController();
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
            child: SingleChildScrollView(
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
                      myController: username,
                      hintText: 'Enter your username',
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
                      height: 33,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (formState.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.infoReverse,
                              animType: AnimType.rightSlide,
                              title: "warning",
                              desc: "Please verify your E-mail.",
                            ).show();
                            if (credential.user!.emailVerified) {
                              Navigator.pushReplacementNamed(context, "home");
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: "Info",
                                desc: "Please check yout E-mail verification",
                              ).show();
                              FirebaseAuth.instance.currentUser!.sendEmailVerification();
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: "warning",
                                desc: "password provided is too weak.",
                              ).show();
                            } else if (e.code == 'email-already-in-use') {
                              print('The account already exists for that email.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: "warning",
                                desc: "The account already exists for that email.",
                              ).show();
                            }
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          print("Not Valid");
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
                        'Sign UP',
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
                              MaterialPageRoute(builder: (context) => const Login()),
                            );
                          },
                          child: const Text(
                            'Sign In',
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
      ),
    );
  }
}
