// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:attendance_app/presentation/home/view/home_page.dart';
import 'package:flutter/material.dart';

import '../../../../logic/login/login_bloc.dart';

import '../../../../shared/util/validator/validator.dart';
import '../../../../shared/widget/container/q_dont_have_account/q_dont_have_accont.dart';
import '../../../../shared/widget/container/q_icon_apps/q_icon_apps.dart';
import '../../../../shared/widget/container/q_or/q_or.dart';
import '../../../../shared/widget/textfield/q_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/dialog/show_info_dialog.dart';
import '../../../shared/show_loading/qloading.dart';
import '../../../shared/widget/button/q_button1/q_button1.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var login = context.read<LoginBloc>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: BlocConsumer<LoginBloc, LoginState>(
                bloc: login,
                listener: (context, state) async {
                  if (state is LoginLoaded) {
                    Map<String, dynamic> data = state.dataUser;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePageView(
                                data: data,
                              )),
                    );
                  }
                  if (state is LoginError) {
                    await showInfoDialog(
                        title: "Kesalahan",
                        message: state.error,
                        buildContext: context);
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return Qloading(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    );
                  }
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        const QIconApps(),
                        const SizedBox(
                          height: 50.0,
                        ),
                        const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        QTextfieldLogin(
                          title: "Email",
                          hintText: "Enter Your Email",
                          controller: email,
                          validator: Validator.required,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        QTextfieldLogin(
                          title: "Password",
                          hintText: "Enter Your Password",
                          obscureText: true,
                          controller: password,
                          validator: Validator.required,
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        QButton(
                          title: "Sign in",
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              login.add(TryLogin(
                                  email: email.text, password: password.text));
                            }
                          },
                          backgroundColor: Colors.red[300],
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        const Qor(
                          sideContainer: false,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        QButton(
                          title: "Check akun",
                          ontap: () async {
                            await showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Wrap(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Text('Informasi Akun'),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            const Column(
                                              children: [
                                                Text(
                                                  "admin@admin.com",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                                Text(
                                                  "password",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Ok"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          backgroundColor: Colors.black,
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        QDontHaveAccont(ontap: () async {
                          const snackBar = SnackBar(
                            content: Text('Fiture ini belum tersedia'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        })
                      ],
                    ),
                  );  
                },
              )),
        ),
      ),
    );
  }
}
